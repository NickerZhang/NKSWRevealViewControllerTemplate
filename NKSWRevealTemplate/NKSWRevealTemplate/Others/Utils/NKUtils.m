//
//  NKUtils.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/18.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKUtils.h"

@implementation NKUtils
/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  比较服务器版本和本地程序版本。
 *
 *  @param sv 服务器版本
 *  @param lv 本地版本
 *
 *  @return YES:更新（server version > local version）, NO:不更新（数据异常或者server version <= local version）
 */
+ (BOOL)compareServerVersion:(NSString*)serverVersion withLocalVersion:(NSString*)localVersion
{
    BOOL ret = NO;
    if (serverVersion == nil || [serverVersion isEqualToString:@""]) {
        NSLog(@"Server version is empty.");
        return ret;
    }
    if (localVersion == nil || [localVersion isEqualToString:@""]) {
        NSLog(@"Local version is empty.");
        return ret;
    }
    
    NSArray *serComps = [serverVersion componentsSeparatedByString:@"."];
    NSArray *locComps = [localVersion componentsSeparatedByString:@"."];
    for (int index = 0; index < serComps.count; index++) {
        int numServer = [[serComps objectAtIndex:index] intValue];
        int numLocal = -1;
        if (locComps.count > index) {
            numLocal = [[locComps objectAtIndex:index] intValue];
        }
        if (numServer > numLocal) {
            ret = YES;
            break;
        } else if (numServer < numLocal) {
            ret = NO;
            break;
        }
    }
    return ret;
}
@end
