//
//  NKFrontController.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKFrontController.h"
#import "NKPushController.h"

@interface NKFrontController ()

@end

@implementation NKFrontController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"frontController";
    [self setupNavigationBar:self.revealViewController buttonImageStr:@"list" Type:ActionTypeList];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    CGPoint center = button.center;
    center.x = 10;
    button.center = center;
    [button addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//页面跳转
- (void)pushVC {
    NKPushController *pushVC = [[NKPushController alloc]init];
    [self.navigationController pushviewController:pushVC fromViewController:self animated:YES];
}

@end
