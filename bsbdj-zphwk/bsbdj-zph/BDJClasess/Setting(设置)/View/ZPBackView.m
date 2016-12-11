//
//  ZPBackView.m
//  bsbdj-zph
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPBackView.h"

@implementation ZPBackView

+ (instancetype)backViewWithNormalName:(NSString *)NormalN HighlightN :(NSString *)HighlightN  title:(NSString *)title target:(id)target action:(SEL)action
{
    
    
    UIButton *Btn=[[UIButton alloc]init];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:NormalN] forState:UIControlStateNormal];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:HighlightN] forState:UIControlStateHighlighted];
    
    [Btn setTitle:title forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Btn sizeToFit];
    
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //用view包装解除超出范围的响应的bug
   ZPBackView *backView=[[self alloc]initWithFrame:Btn.bounds];
    
    [backView  addSubview:Btn];
    
    return backView;
    
    
    
}



@end
