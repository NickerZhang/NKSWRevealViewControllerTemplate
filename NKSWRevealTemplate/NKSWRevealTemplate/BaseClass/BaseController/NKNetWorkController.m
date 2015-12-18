//
//  NKNetWorkController.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKNetWorkController.h"
#import "MBProgressHUD+MJ.h"
#import "NSString+NK.h"

@interface NKNetWorkController ()

@end

@implementation NKNetWorkController

/**
 *  get数据请求
 *
 *  @param url          请求URl
 *  @param param        参数
 *  @param successBlock 成功回调的block
 *  @param failureBlock 失败回调的block
 */
- (void)getRequestURL:(NSString*)url
            parameter:(NSDictionary*)param
              success:(requestSuccess)successBlock
              failure:(requestFailure)failureBlock
{
    MBProgressHUD *loadingHud = [MBProgressHUD showMessage:isLoading toView:self.view];
    param = [self transformToJsonDictionaryWithDictionary:param];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = NKTimeoutInterval;
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self handleSuccessRequestData:responseObject success:successBlock MBProgressHUD:loadingHud];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self handleFailedRequestData:error failure:failureBlock MBProgressHUD:loadingHud];
    }];
    
}

// post数据请求
- (void)postRequestURL:(NSString*)url
             parameter:(NSDictionary*)param
               success:(requestSuccess)successBlock
               failure:(requestFailure)failureBlock
{
    NKLog(@"URL:%@",url);
    NKLog(@"参数：%@",param);
    MBProgressHUD *loadingHud = [MBProgressHUD showMessage:isLoading toView:self.view];
    param = [self transformToJsonDictionaryWithDictionary:param];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = NKTimeoutInterval;
    [manager POST:url
       parameters:param
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [self handleSuccessRequestData:responseObject success:successBlock MBProgressHUD:loadingHud];
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              [self handleFailedRequestData:error failure:failureBlock MBProgressHUD:loadingHud];
              
          }];
}


// 无加载动画的post数据请求
- (void)noAnimationPostRequestURL:(NSString*)url
                        parameter:(NSDictionary*)param
                          success:(requestSuccess)successBlock
                          failure:(requestFailure)failureBlock
{
    NKLog(@"URL:%@",url);
    NKLog(@"参数：%@",param);
    param = [self transformToJsonDictionaryWithDictionary:param];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = NKTimeoutInterval;
    [manager POST:url
       parameters:param
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              NSString *error = [responseObject objectForKey:@"error"];
              if (error != nil && error.length > 0) {
                  //提示错误
                  [MBProgressHUD showError:error toView:self.view];
                  return;
              }
              if (successBlock != nil) {
                  successBlock(responseObject);
              }
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              if (failureBlock != nil) {
                  failureBlock(error);
              }
              [MBProgressHUD showError:error.localizedDescription toView:self.view];
              
          }];
    
}


// 上传图片
- (void)uploadImagesURL:(NSString*)url
             imageArray:(NSArray *)images
          fileNameArray:(NSArray *)fileNames
              parameter:(NSDictionary*)param
                success:(requestSuccess)successBlock
                failure:(requestFailure)failureBlock
{
    
    MBProgressHUD *loadingHud = [MBProgressHUD showMessage:isLoading toView:self.view];
    param = [self transformToJsonDictionaryWithDictionary:param];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = NKTimeoutInterval;
    
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i=0 ; i<images.count; i++) {
            if ([images[i] isKindOfClass:[NSString class]]) {
                continue;
            }
            NSData * data = UIImageJPEGRepresentation(images[i], 0.5);
            NSString *fileName = fileNames[i];
            NSString *mimeType=@"image/jpeg";
            [formData appendPartWithFileData:data name:fileName
                                    fileName:[NSString stringWithFormat:@"%@.jpg",fileName]
                                    mimeType:mimeType];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self handleSuccessRequestData:responseObject success:successBlock MBProgressHUD:loadingHud];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self handleFailedRequestData:error failure:failureBlock MBProgressHUD:loadingHud];
        
    }];
}

#pragma mark - 数据处理
/**
 *  加载成功后的处理
 *
 *  @param responseObject 返回数据
 *  @param successBlock   成功回调的函数
 *  @param hud            MBProgressHUD
 */
- (void)handleSuccessRequestData:(NSDictionary *)responseObject success:(requestSuccess)successBlock MBProgressHUD:(MBProgressHUD *)hud
{
    NSString *error = [responseObject objectForKey:@"error"];
    if (error != nil && error.length > 0) {
        //提示错误
        [hud hide:YES];
        [MBProgressHUD showError:error toView:self.view];
        return;
    }
    [hud hide:YES];
    //    [MBProgressHUD showSuccess:loadingSuccess toView:self.view];
    if (successBlock != nil) {
        successBlock(responseObject);
    }
    
}

/**
 *  加载失败的处理
 *
 *  @param error        错误信息
 *  @param failureBlock 失败回调的函数
 *  @param hud          MBProgressHUD
 */
- (void)handleFailedRequestData:(NSError *)error failure:(requestFailure)failureBlock MBProgressHUD:(MBProgressHUD *)hud
{
    if (failureBlock != nil) {
        failureBlock(error);
    }
    [hud hide:YES];
    [MBProgressHUD showError:error.localizedDescription toView:self.view];
}


#pragma mark - 封装服务器需要的参数
/**
 *  普通字典转化为json字典
 *
 *  @param dict   普通字典
 *
 *  @return json字典
 */
- (NSDictionary *)transformToJsonDictionaryWithDictionary:(NSDictionary *)dict
{
    NSString *bodyString = [NSString jsonStringFrom:dict];
    NSDictionary *jsonDict = @{@"data":bodyString};
    return jsonDict;
}

@end
