//
//  NKPushController.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKPushController.h"

@interface NKPushController ()

@end

@implementation NKPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"pushController";
    [self setupNavigationBar:self.revealViewController buttonImageStr:@"backicon" Type:ActionTypeBack];
}

@end
