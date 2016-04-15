//
//  BFECalendarViewMonths.m
//  CalendarViewMonths
//
//  Created by mingdffe on 16/4/15.
//  Copyright © 2016年 yilin. All rights reserved.
//

#import "BFECalendarViewMonths.h"
#import "BFECalendarButton.h"

@implementation BFECalendarViewMonths
{
    UILabel *_courseInfoLabel;
}

- (void)calendarButtonShowCourseInfoDidSelected:(BFECalendarButton *)btn
{
    btn.titleLabel.text= @"水电费水电费水电费水电费";
    [self addSubview:_courseInfoLabel];
}

- (instancetype)creatCalendarButtonWithframe:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titlecolor font:(UIFont *)font tag:(NSInteger)tag
{
    BFECalendarButton *calendarBtn = [BFECalendarButton buttonWithType:UIButtonTypeCustom
                                                       backgroundColor:[UIColor clearColor]
                                                                 frame:frame
                                                                 title:title
                                                            titleColor:[UIColor blackColor]
                                                                  font:[UIFont fontWithName:@"sssss" size:14]
                                                                   tag:tag];
    return calendarBtn;
}

- (void)createMonthTitle:(NSUInteger)currentMonthIndexOfYear
{
    BFECalendarButton *temp = self.daysButtons[0];
    
    UILabel *monthTitle = [[UILabel alloc] initWithFrame:CGRectMake(temp.frame.origin.x + ButtonWidth/5, self.monthTitleHeight, ButtonWidth, self.weekTitleHeight)];
    monthTitle.text = [NSString stringWithFormat:@"%ld月",currentMonthIndexOfYear];
    monthTitle.font = [UIFont fontWithName:@"sssss" size:17];
    [self addSubview:monthTitle];
    [self drawLine:CGRectMake(temp.frame.origin.x , self.monthTitleHeight + self.weekTitleHeight, CalendarWidth, 1)];
}

- (void)createWeekTitle
{
//    NSArray *weekArray = @[@"Mon",@"Tue",@"Wen",@"Thu",@"Fri",@"Sat",@"Sun"];
//    for (int i = 0; i < weekArray.count; i ++) {
//        UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(ButtonWidth * (i%7), self.monthTitleHeight, ButtonWidth, self.weekTitleHeight)];
//        weekLabel.textAlignment = NSTextAlignmentCenter;
//        weekLabel.text = weekArray[i];
//        weekLabel.font = [UIFont fontWithName:@"sssss" size:14];;
//        [self addSubview:weekLabel];
//    }
//    CGRect frame = CGRectMake(0,  self.monthTitleHeight + self.weekTitleHeight - 1, CalendarWidth, 1);
//    [self drawLine:frame];
}


@end
