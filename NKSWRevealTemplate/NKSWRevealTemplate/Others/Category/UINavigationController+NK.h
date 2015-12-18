//
//  UINavigationController+NK.h
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/17.
//  Copyright © 2015年 Nick. All rights reserved.
//
//  功能：扩展UINavigationController的方法

#import <UIKit/UIKit.h>

@interface UINavigationController (NK)

//跳转页面
- (void)pushviewController:(UIViewController *)desViewController fromViewController:(UIViewController *)sourceViewController animated:(BOOL)animated;

@end
