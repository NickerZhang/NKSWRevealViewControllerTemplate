//
//  NKRearController.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKRearController.h"
#import "NKFrontController.h"
#import "NKNavigationController.h"

@interface NKRearController ()

@end

@implementation NKRearController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    //增加点击收拾切换
    UITapGestureRecognizer *pushFrontVC = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushFrontVC)];
    [self.view addGestureRecognizer:pushFrontVC];
}

//页面跳转
- (void)pushFrontVC
{
    NKFrontController *frontVC = [[NKFrontController alloc]init];
    NKNavigationController *navc = [[NKNavigationController alloc]initWithRootViewController:frontVC];
    SWRevealViewController *revealVC = self.revealViewController;
    [revealVC pushFrontViewController:navc animated:YES];
}


@end
