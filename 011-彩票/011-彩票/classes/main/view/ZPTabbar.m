//
//  ZPTabbar.m
//  011-彩票
//
//  Created by admin on 16/11/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTabbar.h"
@interface ZPTabbar()
@property(nonatomic,weak)UIButton *selbtn;
@end
@implementation ZPTabbar
-(void)setItems:(NSMutableArray *)items{
    _items=items;
    for (int i = 0; i < items.count; ++i) {
        UIButton *btn=[[UIButton alloc]init];
        //取出对应的按钮模型
       UITabBarItem *item=items[i];
        btn.adjustsImageWhenHighlighted=NO;
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState: UIControlStateSelected];
        btn.tag=i;
          [self addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents: UIControlEventTouchDown   ];
        if (i==0) {
            [self btnClick:btn];
        }
    }
    
  
}
-(void)btnClick:(UIButton*)btn{
    _selbtn.selected=NO;
    btn.selected=YES;
    _selbtn=btn;
    if([self.delegate respondsToSelector:@selector(tabbar:selIndex:)]){
    
        [self.delegate tabbar:self selIndex:btn.tag];
    
    }

}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnX=0;
    CGFloat btnY=0;
    CGFloat btnW=self.bounds.size.width/self.items.count;;
    CGFloat btnH=self.bounds.size.height;
    int i=0;
    for (UIButton *btn in self.subviews) {
        btnX=i*btnW;
                btn.frame= CGRectMake( btnX,  btnY,  btnW,  btnH);
         i++;
    }
  

}


@end
