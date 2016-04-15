//
//  BFButton.m
//  BXCalendarButton
//
//  Created by syl on 16/3/23.
//  Copyright © 2016年 boxfish. All rights reserved.
//

#import "BFECalendarButton.h"

@implementation BFECalendarButton

+ (BFECalendarButton *)buttonWithType:(UIButtonType)type
                      backgroundColor:(UIColor *)backgroundColor
                               frame:(CGRect)frame
                               title:(NSString *)title
                          titleColor:(UIColor *)color
                                 font:(UIFont *)font
                                  tag:(NSInteger)tag
{
    BFECalendarButton *calendarbtn = [BFECalendarButton buttonWithType:type];
    calendarbtn.frame = frame;
    calendarbtn.tag = tag;
    [calendarbtn setTitle:title forState:UIControlStateNormal];
    calendarbtn.titleLabel.font = font;
    [calendarbtn setBackgroundColor:backgroundColor];
    [calendarbtn setTitleColor:color forState:UIControlStateNormal];
    return calendarbtn;
}

@end
