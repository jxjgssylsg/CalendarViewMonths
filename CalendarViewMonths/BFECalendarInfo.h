//
//  CalendarModeInfo.h
//  calendar
//
//  Created by syl on 16/3/28.
//  Copyright © 2016年 boxfish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFECalendarInfo : NSObject

@property (nonatomic, assign) NSInteger indexOfday;
@property (nonatomic, copy) NSMutableArray *calendarInfoDetailArray;

- (instancetype)initCalendarDetailInfoArray:(NSArray *)calendarDetailInfoArray dateIndex:(NSInteger)index;

@end

@interface BFECalendarInfoDetail : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *typeOfCourse;
@property (nonatomic, copy) NSString *timeOfCourse;

- (instancetype)initWithImageName:(NSString *)imageName typeOfCourse:(NSString *)typeOfCourse timeOfCourse:(NSString *)timeOfCourse;

@end

