//
//  UIBarButtonItem+ZPItem.h
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZPItem)

/**
 
 设置导航条
 */
+ (instancetype)BarButtonItemWithNormalName:(NSString *)NormalN HighlightN :(NSString *)HighlightN target:(id)target action:(SEL)action;


+ (instancetype)BarButtonItemWithNormalName:(NSString *)NormalN SelectedN :(NSString *)SelectedN target:(id)target action:(SEL)action;

+ (instancetype)BarButtonItemWithNormalName:(NSString *)NormalN HighlightN :(NSString *)HighlightN  title:(NSString *)title target:(id)target action:(SEL)action;
@end
