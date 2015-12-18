//
//  NKBaseController.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKBaseController.h"
#import "NKBaseController.h"

@interface NKBaseController ()<SWRevealViewControllerDelegate>

@end

@implementation NKBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    //设置手势滑动
    SWRevealViewController *revealVC = self.revealViewController;
    revealVC.delegate = self;
    if (revealVC != nil) {
        revealVC.rearViewRevealWidth = kScreenViewWidth-(70*kWidthRatio);
        [revealVC panGestureRecognizer];
    }
}

#pragma mark - SWRevealViewController delegate
//根据actionType来响应PanGesture
- (BOOL)revealControllerPanGestureShouldBegin:(SWRevealViewController *)revealController
{
    if (self.actionType == ActionTypeBack) {
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - 设置导航条
- (void)setupNavigationBar:(SWRevealViewController *)reveal buttonImageStr:(NSString *)imageStr Type:(ActionType)type
{
    self.actionType = type;
    if (type == ActionTypeList) {
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(slideLeftVc)];
        self.navigationItem.leftBarButtonItem = leftBarButton;
    }else if (type == ActionTypeBack){
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backup)];
        self.navigationItem.leftBarButtonItem = leftBarButton;
    }
}

/**
 *  显示左侧列表
 */
- (void)slideLeftVc
{
    [self.view endEditing:YES];
    SWRevealViewController *revealVC = self.revealViewController;
    [revealVC revealToggleAnimated:YES];
}

/**
 *  返回上一层
 */
- (void)backup
{
    [self.navigationController popViewControllerAnimated:YES];
}

//设置状态来的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
