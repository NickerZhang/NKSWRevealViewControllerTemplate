//
//  AppDelegate.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/16.
//  Copyright © 2015年 Nick. All rights reserved.
//


#import "AppDelegate.h"
#import "NKFrontController.h"
#import "NKRearController.h"
#import "NKNavigationController.h"
#import "NKBaseController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:kScreenViewBounds];
    self.window.backgroundColor = [UIColor whiteColor];
    NKFrontController *frontVc = [[NKFrontController alloc]init];
    NKNavigationController *navc = [[NKNavigationController alloc]initWithRootViewController:frontVc];
    NKRearController *rearVC = [[NKRearController alloc]init];
    SWRevealViewController *reveal = [[SWRevealViewController alloc]initWithRearViewController:rearVC frontViewController:navc];
    self.window.rootViewController = reveal;
    [self.window makeKeyAndVisible];
    
    //检测版本
    [self checkVersionFromAppStore];
    return YES;
}

#pragma mark - 检测版本
- (void)checkVersionFromAppStore
{
    NSString *url = [[NSString alloc]initWithFormat:@"https://itunes.apple.com/lookup?id=950904644"];
    NKBaseController *netVC = [[NKBaseController alloc]init];
    [netVC getRequestURL:url parameter:nil success:^(id responseObject) {
        NKLog(@"版本信息：%@",responseObject);
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *localVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        NSDictionary *versionInfo = [[responseObject objectForKey:@"results"]firstObject];
        NSString *serverVersion = [versionInfo objectForKey:@"version"];
        NSString *message = [versionInfo objectForKey:@"releaseNotes"];
        if ([NKUtils compareServerVersion:serverVersion withLocalVersion:localVersion])
        {
            NSString *title = [NSString stringWithFormat:@"新版本%@上线了",serverVersion];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:nil delegate:self cancelButtonTitle:@"更新"otherButtonTitles:@"取消",nil];
            CGSize size = [NKUtils sizeWithText:message font:[UIFont systemFontOfSize:17] maxSize:CGSizeMake(230,400)];
            UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0,0,200, size.height +10)];
            textView.editable = NO;
            textView.selectable = NO;
            textView.font = [UIFont systemFontOfSize:15];
            textView.backgroundColor = [UIColor clearColor];
            textView.text = message;
            // iOS8以上系统，充满整个AlertView，需要调整边距
            if (NSOrderedAscending != [[[UIDevice currentDevice] systemVersion] compare:@"8.0"])
            {
                UIEdgeInsets e =UIEdgeInsetsMake(0,20,0, 0);
                [textView setTextContainerInset:e];
            }
            [alertView setValue:textView forKey:@"accessoryView"];
            alertView.message =@"";
            [alertView show];
        }
    } failure:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/zhi-dong-sheng-huo-shang-jia/id950904644?mt=8"]];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
