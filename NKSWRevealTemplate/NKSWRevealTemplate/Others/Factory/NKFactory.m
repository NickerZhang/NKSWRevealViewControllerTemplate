//
//  NKFactory.m
//  NKSWRevealTemplate
//
//  Created by Nick on 15/12/18.
//  Copyright © 2015年 Nick. All rights reserved.
//

#import "NKFactory.h"

@implementation NKFactory
//*************************Label********************//

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(NSInteger)font
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    //    label.backgroundColor = [UIColor greenColor];
    return label;
}

//*************************textView********************//

+ (UITextView *)createTextViewWithFrame:(CGRect)frame placholder:(NSString *)placholder backgroundColor:(UIColor *)backgroudColor textColor:(UIColor *)textColor;
{
    UITextView * textView = [[UITextView alloc]initWithFrame:frame];
    textView.backgroundColor = backgroudColor;
    textView.text = placholder;
    textView.textColor = textColor;
    return textView;
}

//*************************textField********************//

//  带有边框的textField
+ (UITextField *)createTextFieldWithframe:(CGRect)frame font:(UIFont*)font placeHodler:(NSString *)placeHodler textColor:(UIColor *)textColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRedio:(CGFloat)cornerRedio
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.font = font;
    textField.layer.cornerRadius = cornerRedio;
    textField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    textField.layer.borderWidth = borderWidth;
    textField.clipsToBounds = YES;
    textField.placeholder = placeHodler;
    return textField;
}

//************************* button ********************//

//创建带有高亮背景图片的button
+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroudImageName:(NSString *)backgroudImageName heightlightedBackgroudImageName:(NSString *)heightlightedBackgroudImageName title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    if (backgroudImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backgroudImageName] forState:UIControlStateNormal];
    }
    if (heightlightedBackgroudImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:heightlightedBackgroudImageName] forState:UIControlStateHighlighted];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return button;
}


@end
