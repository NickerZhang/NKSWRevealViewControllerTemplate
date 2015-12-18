//
//  NKNavigationController.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKNavigationController.h"
#import "UIImage+NK.h"

@interface NKNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation NKNavigationController

#pragma mark - 主题设置
/**
 *  初始化NavitionBar的appearance
 */
+ (void)initialize
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 设置背景图片
    UIImage *backgroudImage = [UIImage imageWithColor:UIColorFromRGB(0xd5261a)];
    [navigationBar setBackgroundImage:backgroudImage forBarMetrics:UIBarMetricsDefault];
    // 设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navigationBar setTitleTextAttributes:attrs];
    
    // 2.设置BarButtonItem的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置文字颜色
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
}

//设置状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -  加载Controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    //支持右滑返回
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

@end
