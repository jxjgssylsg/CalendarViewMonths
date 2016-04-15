//
//  CalendarModeInfo.m
//  calendar
//
//  Created by syl on 16/3/28.
//  Copyright © 2016年 boxfish. All rights reserved.
//

#import "BFECalendarInfo.h"

@implementation BFECalendarInfo

- (instancetype)initCalendarDetailInfoArray:(NSMutableArray *)calendarDetailInfoArray dateIndex:(NSInteger)index
{
    if (self = [super init]) {
        self.calendarInfoDetailArray = calendarDetailInfoArray;
        self.indexOfday = index;
    }
    return self;
}

@end

@implementation BFECalendarInfoDetail

- (instancetype)initWithImageName:(NSString *)imageName typeOfCourse:(NSString *)typeOfCourse timeOfCourse:(NSString *)timeOfCourse
{
    if (self = [super init]) {
        self.imageName = imageName;
        self.typeOfCourse = typeOfCourse;
        self.timeOfCourse = timeOfCourse;
    }
    return self;
}

@end