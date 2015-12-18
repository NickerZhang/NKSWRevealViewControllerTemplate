//
//  NKUtils.h
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/18.
//  Copyright © 2015年 Nick. All rights reserved.
//
//  功能：功能方法类

#import <Foundation/Foundation.h>

@interface NKUtils : NSObject
//根据文字来动态获取size
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;
//比较版本
+ (BOOL)compareServerVersion:(NSString*)serverVersion withLocalVersion:(NSString*)localVersion;
@end
