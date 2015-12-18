//
//  NSString+NK.h
//  business
//
//  Created by Nick on 15/3/3.
//  Copyright (c) 2015年 ZhiDongLife. All rights reserved.
//
//  功能：扩展NSString的方法

#import <Foundation/Foundation.h>

@interface NSString (NK)

/** 字典或者数组转化为json串 */
+ (NSString *)jsonStringFrom:(id)jsonObject ;

@end
