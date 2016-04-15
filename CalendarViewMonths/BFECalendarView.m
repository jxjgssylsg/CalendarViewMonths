//
//  calendarViewController.m
//  calendar
//
///  Created by syl on 16/3/23.
//  Copyright © 2016年 boxfish. All rights reserved.
//



#import "BFECalendarView.h"
#import "BFECalendarButton.h"
#import "BFECalendarInfo.h"
//#import "BFECommonTools.h"

@interface BFECalendarView ()

@end

@implementation BFECalendarView


- (instancetype)initWithFrame:(CGRect)frame
                 initWithDate:(NSDate *)date
             monthTitleHeight:(CGFloat)monthTitleHeight
             buttonHeight:(CGFloat)buttonHeight
             weekTitleHeight:(CGFloat)weekTitleHeight
             agendaOfMonth:(NSArray *)courseInfoOfMonth
{
    if (self = [super initWithFrame:frame]) {
        _dateNeedshow = date;
        _courseInfoOfMonth = courseInfoOfMonth;
        _monthTitleHeight = monthTitleHeight;
        _buttonHeight = buttonHeight;
        _weekTitleHeight = weekTitleHeight;
        [self createCalendar];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                 initWithDate:(NSDate *)date
             monthTitleHeight:(CGFloat)monthTitleHeight
                 buttonHeight:(CGFloat)buttonHeight
              weekTitleHeight:(CGFloat)weekTitleHeight
                agendaOfMonth:(NSArray *)courseInfoOfMonth
                horizontalGap:(NSInteger)horizontalGap
                  verticalGap:(NSInteger)verticalGap
{
    _horizontalGap = 1;
    _verticalGap   = verticalGap;
    
  self = [self  initWithFrame:(CGRect)frame
                 initWithDate:(NSDate *)date
             monthTitleHeight:(CGFloat)monthTitleHeight
                 buttonHeight:(CGFloat)buttonHeight
                weekTitleHeight:(CGFloat)weekTitleHeight
                  agendaOfMonth:(NSArray *)courseInfoOfMonth];

    return self;
}

- (void)createCalendar
{
    if (!_dateNeedshow) {
        _dateNeedshow = [NSDate date];
    }
    
    _myCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [_myCalendar setFirstWeekday:StartForMondayOfWeek];
    [_myCalendar setMinimumDaysInFirstWeek:1];
    [_myCalendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    
    NSTimeInterval interval = 0;
    NSDate *firstDayOfMonth = nil;
    if ([_myCalendar rangeOfUnit: NSCalendarUnitMonth startDate:&firstDayOfMonth interval:&interval forDate:_dateNeedshow]) {
        NSLog(@"%@",firstDayOfMonth.description);
    }
    
    NSRange monthDays = [_myCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_dateNeedshow];
    
    NSUInteger currentMonthIndexOfYear = [_myCalendar ordinalityOfUnit:NSCalendarUnitMonth inUnit:NSCalendarUnitYear forDate:_dateNeedshow];
    
     _firstDayIndexOfWeek = [_myCalendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonth];
    
    [self drawCalendar:monthDays currentMonthIndexOfYear:currentMonthIndexOfYear firstDayIndexOfWeek:_firstDayIndexOfWeek];
}

-(void)drawCalendar:(NSRange)monthDays currentMonthIndexOfYear:(NSUInteger)currentMonthIndexOfYear firstDayIndexOfWeek:(NSUInteger)firstDayIndexOfWeek
{
    [self initNumbers];

    [self createWeekTitle];
    [self createButton:monthDays firstDayIndexOfWeek:firstDayIndexOfWeek];
    
        [self createMonthTitle:currentMonthIndexOfYear];
}

- (void)initNumbers
{
    _currentTag = CurrentButtonTag;
    _daysButtons = [[NSMutableArray alloc] init];
}



- (void)createButton:(NSRange)monthDays firstDayIndexOfWeek:(NSUInteger)firstDayIndexOfWeek
{
    
    CGFloat verticalLineYstart = 0;
    CGFloat verticalLineYend = 0;
    float  xCoodinates[numberDaysOfWeek] = {0,0,0,0,0,0,0};
    CGFloat buttonWidth = ((self.bounds.size.width-6*self.verticalGap)/ numberDaysOfWeek);
    
    NSLog(@"%f",buttonWidth);
    NSLog(@"%f",ButtonWidth);
    
    for (NSUInteger i = firstDayIndexOfWeek - 1 ; i < monthDays.length + firstDayIndexOfWeek - 1 ; i ++) {
        
        CGRect frame = CGRectMake(buttonWidth * (i%numberDaysOfWeek) + (i%numberDaysOfWeek)*self.verticalGap, self.weekTitleHeight + self.monthTitleHeight + (i / numberDaysOfWeek) + self.buttonHeight*(i/numberDaysOfWeek), buttonWidth,self.buttonHeight);
        xCoodinates[i%numberDaysOfWeek] = buttonWidth * (i%numberDaysOfWeek) + (i%numberDaysOfWeek)*self.verticalGap - self.verticalGap;
        NSInteger tag = i + 2 - firstDayIndexOfWeek;
        if (1 == tag) {
            verticalLineYstart = self.weekTitleHeight + self.monthTitleHeight + (i / numberDaysOfWeek) ;
        }
        NSString *title = [NSString stringWithFormat:@"%ld",(long)tag];
       
        //日子单元
        UIButton *calendarButton =[self creatCalendarButtonWithframe:frame backgroundColor:[UIColor clearColor] title:title titleColor:[UIColor blackColor] font:[UIFont fontWithName:@"SSSS" size:14] tag:tag];
        [calendarButton addTarget:self action:@selector(calendarButtonShowCourseInfoDidSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.daysButtons addObject:calendarButton];
        [self addSubview:calendarButton];
        
        if (0 == i % numberDaysOfWeek) {
//             UIButton *weizhanshi =self.daysButtons[i -5 - i%3]; //为展示 -删
//              weizhanshi.backgroundColor= COLOR(255, 228, 138);  //为展示 -删
            NSLog(@"______我来了\n");
            CGRect frame = CGRectMake(0, CGRectGetMinY(calendarButton.frame) - 1, CalendarWidth, 1);
            [self drawLine:frame];
        } else if (monthDays.length == tag) {
            
            NSLog(@"______我去了\n");
            verticalLineYend =  CGRectGetMaxY(calendarButton.frame);
            CGRect frame = CGRectMake(0, CGRectGetMaxY(calendarButton.frame) - 1, CalendarWidth, 1);
            [self drawLine:frame];
        }
        
    }
    
//    for (BFECalendarInfo *info in self.courseInfoOfMonth) {
//        BFECalendarButton *temp_button = self.daysButtons[info.indexOfday - 1];
//        temp_button.studentCourseInfoEveryDay = info.calendarInfoDetailArray;
//        temp_button.backgroundColor = COLOR(255, 228, 138);
//    }
    
    for (NSInteger i = 1; i < numberDaysOfWeek; i++) {
        NSLog(@"_划竖线\n");
        CGRect frame = CGRectMake(xCoodinates[i], verticalLineYstart , self.verticalGap , verticalLineYend - verticalLineYstart);
        [self drawLine:frame];
    }
}

- (void)drawLine:(CGRect)frame
{
    UIView *lineUiew = [[UIView alloc] initWithFrame:frame];
    lineUiew.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
    [self addSubview:lineUiew];
}

#pragma mark currentDateOfMonth

- (NSUInteger)currentDateOfMonth
{
    return [_myCalendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_dateNeedshow];
}

#pragma mark - Observer

- (void)calendarButtonShowCourseInfoDidSelected:(UIView *)btn
{
    // 在子类中 实现
}

- (id)creatCalendarButtonWithframe:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titlecolor font:(UIFont *)font tag:(NSInteger)tag
{
    // 在子类中 实现
    return nil;
}
- (void)createMonthTitle:(NSUInteger)currentMonthIndexOfYear
{
    // 在子类中 实现
}
- (void)createWeekTitle
{
    // 在子类中 实现
}

@end
