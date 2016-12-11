//
//  ZPBackView.h
//  bsbdj-zph
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPBackView : UIView

+ (instancetype)backViewWithNormalName:(NSString *)NormalN HighlightN :(NSString *)HighlightN  title:(NSString *)title target:(id)target action:(SEL)action;

@end
