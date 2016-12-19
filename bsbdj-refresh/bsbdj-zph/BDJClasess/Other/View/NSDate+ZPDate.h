//
//  NSDate+ZPDate.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/16.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZPDate)


/**判断是不是今年*/
-(BOOL)isThisYear;


/**判断是不是今天*/
-(BOOL)isToday;


/**判断是不是昨天*/
-(BOOL)isToyesterday;


/**返回小时和分钟的组件*/
-(NSDateComponents*)dealTime;
@end
