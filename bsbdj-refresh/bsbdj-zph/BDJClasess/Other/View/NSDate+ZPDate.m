//
//  NSDate+ZPDate.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/16.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "NSDate+ZPDate.h"

@implementation NSDate (ZPDate)

//判断是不是今年
-(BOOL)isThisYear
{
   //创建一个日历
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    //创建时间插件
    NSDateComponents  *currentCom=[calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSDateComponents  *createCom=[calendar components:NSCalendarUnitYear fromDate:self];
    
    
    return currentCom.year==createCom.year;

}

//判断是不是今天
-(BOOL)isToday
{
  NSCalendar  *calendar=[NSCalendar currentCalendar];
    
  return   [calendar isDateInToday:self];

}


//判断是不是昨天
-(BOOL)isToyesterday
{
    NSCalendar  *calendar=[NSCalendar currentCalendar];
    
    return   [calendar isDateInYesterday:self];
    
}


-(NSDateComponents*)dealTime
{

    NSCalendar  *calendar=[NSCalendar currentCalendar];

   
    return [calendar components: NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
}
@end
