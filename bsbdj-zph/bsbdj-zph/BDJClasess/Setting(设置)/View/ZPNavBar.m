//
//  ZPNavBar.m
//  bsbdj-zph
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPNavBar.h"

@implementation ZPNavBar
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews)
    {
        if([view isKindOfClass:NSClassFromString(@"ZPBackView")])
        {
            view.x=0;
    }

    }
}

@end
