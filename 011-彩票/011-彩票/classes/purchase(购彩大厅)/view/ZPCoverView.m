//
//  ZPCoverView.m
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPCoverView.h"

@implementation ZPCoverView


+ (instancetype)show
{
    ZPCoverView   *view=[[ZPCoverView alloc]init];
    //设置背景颜色
    view.backgroundColor=[UIColor blackColor];
    view.alpha=0.6;
    view.frame=[UIScreen mainScreen].bounds ;
    
    //把要显示的内容添加到窗口
    
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    return view;
    
}

+(void)hidden
{
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if([view isKindOfClass:[ZPCoverView class]])
        {
        
            [view removeFromSuperview];
        }
    }


}
@end
