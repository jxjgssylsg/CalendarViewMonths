//
//  calendarViewController.h
//  calendar
//
//  Created by syl on 16/3/23.
//  Copyright © 2016年 boxfish. All rights reserved.
//
#define CalendarWidth self.bounds.size.width
#define ButtonWidth (self.bounds.size.width / 7)
#define numberDaysOfWeek 7
#define StartForMondayOfWeek 2
#define StartForSundayOfWeek 1

#import <UIKit/UIKit.h>

#define CurrentButtonTag -1

@class BFECalendarButton;

@interface BFECalendarView : UIView

@property (nonatomic, strong) NSMutableArray *daysButtons;
@property (nonatomic, strong) NSArray *courseInfoOfMonth;       
@property (nonatomic, assign) NSInteger currentTag;
@property (nonatomic, assign, readonly) NSUInteger currentDateOfMonth;
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat weekTitleHeight;
@property (nonatomic, assign) CGFloat monthTitleHeight;
@property (nonatomic, assign) NSInteger firstDayIndexOfWeek;
@property (nonatomic, strong) NSCalendar *myCalendar;
@property (nonatomic, strong) NSDate *dateNeedshow;
@property (nonatomic, assign) NSInteger horizontalGap;
@property (nonatomic, assign) NSInteger verticalGap;

- (instancetype)initWithFrame:(CGRect)frame
                 initWithDate:(NSDate *)date
             monthTitleHeight:(CGFloat)monthTitleHeight
                 buttonHeight:(CGFloat)buttonHeight
              weekTitleHeight:(CGFloat)weekTitleHeight
                agendaOfMonth:(NSArray *)courseInfoOfMonth;

- (instancetype)initWithFrame:(CGRect)frame
                 initWithDate:(NSDate *)date
             monthTitleHeight:(CGFloat)monthTitleHeight
                 buttonHeight:(CGFloat)buttonHeight
              weekTitleHeight:(CGFloat)weekTitleHeight
                agendaOfMonth:(NSArray *)courseInfoOfMonth
                horizontalGap:(NSInteger)horizontalGap
                  verticalGap:(NSInteger)verticalGap;

- (void)createCalendar;
- (void)drawCalendar:(NSRange)monthDays currentMonthIndexOfYear:(NSUInteger)currentMonthIndexOfYear firstDayIndexOfWeek:(NSUInteger)firstDayIndexOfWeek;
- (void)initNumbers;


- (void)createMonthTitle:(NSUInteger)currentMonthIndexOfYear;
- (void)createWeekTitle;
- (void)createButton:(NSRange)monthDays firstDayIndexOfWeek:(NSUInteger)firstDayIndexOfWeek;

- (void)drawLine:(CGRect)frame;
- (NSUInteger)currentDateOfMonth;
- (void)calendarButtonShowCourseInfoDidSelected:(UIView *)btn;

- (id)creatCalendarButtonWithframe:(CGRect)frame
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title
                            titleColor:(UIColor *)titlecolor
                            font:(UIFont *)font
                            tag:(NSInteger)tag;

@end
