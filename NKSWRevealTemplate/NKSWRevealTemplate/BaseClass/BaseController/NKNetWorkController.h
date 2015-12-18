//
//  NKNetWorkController.h
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

//定义block
typedef void (^requestSuccess) (id responseObject);
typedef void (^requestFailure) (NSError * error);

@interface NKNetWorkController : UIViewController

// get数据请求
- (void)getRequestURL:(NSString*)url
            parameter:(NSDictionary*)param
              success:(requestSuccess)successBlock
              failure:(requestFailure)failureBlock;

// post数据请求
- (void)postRequestURL:(NSString*)url
             parameter:(NSDictionary*)param
               success:(requestSuccess)successBlock
               failure:(requestFailure)failureBlock;

// 无加载动画的post数据请求
- (void)noAnimationPostRequestURL:(NSString*)url
                        parameter:(NSDictionary*)param
                          success:(requestSuccess)successBlock
                          failure:(requestFailure)failureBlock;


// 上传图片
- (void)uploadImagesURL:(NSString*)url
             imageArray:(NSArray *)images
          fileNameArray:(NSArray *)fileNames
              parameter:(NSDictionary*)param
                success:(requestSuccess)successBlock
                failure:(requestFailure)failureBlock;


@end
