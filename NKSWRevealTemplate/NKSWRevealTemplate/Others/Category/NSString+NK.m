//
//  NSString+NK.m
//  business
//
//  Created by Nick on 15/3/3.
//  Copyright (c) 2015年 ZhiDongLife. All rights reserved.
//
//  功能名称：转化为json串的NSString的类别
//  功能描述：字典或者数组转化为json串

#import "NSString+NK.h"

@implementation NSString (NK)

/**
 *  字典或者数组转化为json串
 *
 *  @param jsonObject 转化的对象
 *
 *  @return json串
 */
+ (NSString *)jsonStringFrom:(id)jsonObject
{
    if (jsonObject == nil) return @"";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:&error];
    if (error) NSLog(@"[%@ %@] e: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
    NSString * jsonString=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}


@end
