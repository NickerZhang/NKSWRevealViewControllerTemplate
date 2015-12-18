//
//  UINavigationController+NK.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/17.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "UINavigationController+NK.h"

@implementation UINavigationController (NK)

//push的时候根据frontController的位置采取不同的处理
- (void)pushviewController:(UIViewController *)desViewController fromViewController:(UIViewController *)sourceViewController animated:(BOOL)animated
{
    SWRevealViewController *revealVc = sourceViewController.revealViewController;
    if (revealVc.frontViewPosition != FrontViewPositionLeft) {
        revealVc.frontViewPosition = FrontViewPositionLeft;
    }else{
        [self pushViewController:desViewController animated:animated];
    }
}

@end
