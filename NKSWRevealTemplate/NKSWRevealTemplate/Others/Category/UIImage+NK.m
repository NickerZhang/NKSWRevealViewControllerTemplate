//
//  UIImage+NK.m
//  SlideTemplate
//
//  Created by Nick on 15/9/14.
//  Copyright (c) 2015年 Nick. All rights reserved.
//

#import "UIImage+NK.h"

@implementation UIImage (NK)

/** 创建颜色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
