//
//  NKBaseController.h
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKNetWorkController.h"


typedef NS_ENUM(NSInteger, ActionType)
{
    ActionTypeList = 1,  //列表图标
    ActionTypeBack  //返回按钮
};

@interface NKBaseController : NKNetWorkController

//控制左右滑手势的属性
@property (nonatomic, assign) ActionType actionType;

//设置导航栏
- (void)setupNavigationBar:(SWRevealViewController *)reveal buttonImageStr:(NSString *)imageStr Type:(ActionType)type;

@end
