//
//  NKFactory.h
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/18.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKFactory : NSObject
//*************************Label********************//

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(NSInteger)font;

//*************************textView********************//

+ (UITextView *)createTextViewWithFrame:(CGRect)frame placholder:(NSString *)string backgroundColor:(UIColor *)backgroudColor textColor:(UIColor *)textColor;

//*************************textField********************//

/** 带有边框的textField */
+ (UITextField *)createTextFieldWithframe:(CGRect)frame font:(UIFont*)font placeHodler:(NSString *)placeHodler textColor:(UIColor *)textColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRedio:(CGFloat)cornerRedio;

//************************* button ********************//

//创建带有高亮背景图片的button
+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroudImageName:(NSString *)backgroudImageName heightlightedBackgroudImageName:(NSString *)heightlightedBackgroudImageName title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor;


@end
