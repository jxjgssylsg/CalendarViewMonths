//
//  BFButton.h
//  BXCalendarButton
//
//  Created by syl on 16/3/23.
//  Copyright © 2016年 boxfish. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFECalendarButton;

@interface BFECalendarButton : UIButton

@property (nonatomic, copy) NSArray *studentCourseInfoEveryDay;

+ (BFECalendarButton *)buttonWithType:(UIButtonType)type
                      backgroundColor:(UIColor *)backgroundColor
                                frame:(CGRect)frame
                                title:(NSString *)title
                           titleColor:(UIColor *)color
                                 font:(UIFont *)font
                                  tag:(NSInteger)tag;
@end
