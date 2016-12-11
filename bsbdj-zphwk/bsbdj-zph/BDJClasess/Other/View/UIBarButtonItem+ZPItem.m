//
//  UIBarButtonItem+ZPItem.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "UIBarButtonItem+ZPItem.h"

@implementation UIBarButtonItem (ZPItem)


+ (instancetype)BarButtonItemWithNormalName:(NSString *)NormalN HighlightN :(NSString *)HighlightN target:(id)target action:(SEL)action
{
    
    
    UIButton *Btn=[[UIButton alloc]init];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:NormalN] forState:UIControlStateNormal];
    [Btn sizeToFit];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:HighlightN] forState:UIControlStateHighlighted];
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //用view包装解除超出范围的响应的bug
    UIView *contionV=[[UIView alloc]initWithFrame:Btn.bounds];
    
    [contionV  addSubview:Btn];
    return [[self alloc]initWithCustomView:contionV];
    
    
    
}

+ (instancetype)BarButtonItemWithNormalName:(NSString *)NormalN SelectedN :(NSString *)SelectedN target:(id)target action:(SEL)action
{
    
    
    UIButton *Btn=[[UIButton alloc]init];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:NormalN] forState:UIControlStateNormal];
    [Btn sizeToFit];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:SelectedN] forState:UIControlStateSelected];
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //用view包装解除超出范围的响应的bug
    UIView *contionV=[[UIView alloc]initWithFrame:Btn.bounds];
    
    [contionV  addSubview:Btn];
    return [[self alloc]initWithCustomView:contionV];
    
    
    
}

+ (instancetype)BarButtonItemWithNormalName:(NSString *)NormalN HighlightN :(NSString *)HighlightN  title:(NSString *)title target:(id)target action:(SEL)action
{
    
    
    UIButton *Btn=[[UIButton alloc]init];
    [Btn setImage:[UIImage imageWithRenderOriginalModeName:NormalN] forState:UIControlStateNormal];
        [Btn setImage:[UIImage imageWithRenderOriginalModeName:HighlightN] forState:UIControlStateHighlighted];
    
    [Btn setTitle:title forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Btn sizeToFit];

    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //用view包装解除超出范围的响应的bug
    UIView *contionV=[[UIView alloc]initWithFrame:Btn.bounds];
    
    [contionV  addSubview:Btn];
    [Btn setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    return [[self alloc]initWithCustomView:contionV];
    
    
    
}


@end
