//
//  ZPBottomView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/16.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPBottomView.h"
#import "ZPTopItem.h"
@interface  ZPBottomView()

@property(nonatomic,weak)UIView *linV;

@end;
@implementation ZPBottomView

+ (instancetype)bottomView
{
    
    ZPBottomView   *bv=[[ZPBottomView alloc]init];
    [bv bottomViewaddChildControls];
    return bv;
    
}

- (void)setFrame:(CGRect)frame {
    
    frame.origin = CGPointMake(10, frame.origin.y);
    frame.size = CGSizeMake(ScreenW - 20, frame.size.height);
    
    [super setFrame:frame];
    
}

//添加内部子控件
-  (void)bottomViewaddChildControls
{

    UIView *lv=[[UIView alloc]init];
    lv.frame = CGRectMake(0, 0, ScreenW, 1);
    lv.backgroundColor=[UIColor grayColor];
    self.linV=lv;
   [self addSubview:lv];
       for (int i=0; i<4; i++) {
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.tag=i;
        [self addSubview:btn];
        
    }
    
    
}


- (void)setTopItem:(ZPTopItem *)topItem
{
    _topItem=topItem;
    
    for (UIView *btn1 in self.subviews) {
        if([btn1 isKindOfClass:[UIButton class]]){
          UIButton  *btn=(UIButton *)btn1;
        if(btn.tag==0)
        {
            [self setUPBtnWithimageName:@"mainCellDing" nameH:@"mainCellDingClick" title:topItem.ding btn:btn];
        }else if(btn.tag==1){
            [self setUPBtnWithimageName:@"mainCellCai" nameH:@"mainCellCaiClick" title:topItem.cai btn:btn];
            
        }else if(btn.tag==2){
            [self setUPBtnWithimageName:@"mainCellShare" nameH:@"mainCellShareClick" title:topItem.comment btn:btn];
            
        }else if(btn.tag==3){
            
            [self setUPBtnWithimageName:@"mainCellComment" nameH:@"mainCellCommentClick" title:topItem.repost btn:btn];
        }
        
    }
    
    }
    
}

//设置数据
- (void)setUPBtnWithimageName:(NSString *)name nameH:(NSString*)nameH title :(NSString*)title btn:(UIButton *)btn
{
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:nameH] forState:UIControlStateHighlighted];
    NSInteger num=title.integerValue;
    
    if(num>=10000)
    {
        title=[NSString stringWithFormat:@"%.2lf",num/10000.0];
    
    }
    [btn setTitle:title forState:UIControlStateNormal];
    
}

//布局子控件的位置
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewW=self.width;
    CGFloat viewH=self.hight;
    CGFloat btnW=viewW/4;
    self.linV.frame=CGRectMake(-10, 0, ScreenW, 1);
    for (UIView *btn1 in self.subviews) {
        if([btn1 isKindOfClass:[UIButton class]]){
           
            UIButton  *btn=(UIButton *)btn1;
            
        btn.frame=CGRectMake(btn.tag*btnW, 0, btnW, viewH-1);
    }
    
    
}
}
@end
