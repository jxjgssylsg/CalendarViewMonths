//
//  ViewController.m
//  CalendarViewMonths
//
//  Created by mingdffe on 16/4/15.
//  Copyright © 2016年 yilin. All rights reserved.
//

#import "ViewController.h"
#import "BFECalendarViewMonths.h"

@interface ViewController ()
{
    BFECalendarViewMonths  *_calendarView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
            _calendarView = [[BFECalendarViewMonths alloc] initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 402)
                                                                    initWithDate:[NSDate date]
                                                                monthTitleHeight:44
                                                                    buttonHeight:46
                                                                 weekTitleHeight:35
                                                                   agendaOfMonth:nil];
    [self.view addSubview:_calendarView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
