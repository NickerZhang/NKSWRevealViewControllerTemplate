//
//  Common.h
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//
//  功能：存放常用宏定义

#ifndef Common_h
#define Common_h

//================ 网络相关 ======================
#define kDominURL           @"http://www.baidu.com"
#define kBaseURL(path)      kDominURL #path

//================ 屏幕尺寸适配相关 =================
//屏幕的宽、高、bounds
#define kScreenViewWidth          [UIScreen mainScreen].bounds.size.width
#define kScreenViewHeight         [UIScreen mainScreen].bounds.size.height
#define kScreenViewBounds         [UIScreen mainScreen].bounds
//相对于5s的宽、高比例
#define kWidthRatio                kScreenViewWidth/320.0f
#define kHeightRatio               kScreenViewHeight/568.0f
//根据尺寸判断是什么机型
#define kIsIphone4s                ([UIScreen mainScreen].bounds.size.height == 480.0f)
#define kIsIphone5s                ([UIScreen mainScreen].bounds.size.height == 568.0f)
#define kIsIphone6                 ([UIScreen mainScreen].bounds.size.height == 667.0f)

//================ UI配置 =================
//十六进制颜色设置Color
#define UIColorFromRGB(rgbValue)\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

//================ 系统信息 =================
//系统版本
#define kSystemVersion                [[UIDevice currentDevice].systemVersion floatValue]
//App版本号
#define kAppCurrentVersion            [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

#endif /* Common_h */
