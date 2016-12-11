//
//  ZPMiCollectionViewCell.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/10.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPMiCollectionViewCell.h"
#import "ZPMineItem.h"
#import <UIImageView+WebCache.h>
@interface ZPMiCollectionViewCell()
@property(nonatomic,weak)UIImageView *imageV;

@property(nonatomic,weak)UILabel *nameL;
@end
@implementation ZPMiCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{  if(self=[super initWithFrame:frame])
{
    
    [self AddChildControl];
    
}
    return self;
}

- (void)AddChildControl
{
    
    UIImageView *imageV=[[UIImageView alloc]init];
    
    [self addSubview:imageV];
    self.imageV=imageV;
    UILabel *nameL=[[UILabel alloc]init];
    
    [self addSubview:nameL];
    self.nameL=nameL;
}

- (void)setItem:(ZPMineItem *)item
{
    _item=item;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    
    self.nameL.text=item.name;
    
}

-(void)layoutSubviews
{
    CGFloat sp=15;
    
    CGFloat wh=self.frame.size.width-sp*2;
    
    
    self.imageV.centerX=self.width*0.5;
    
    
    self.imageV.frame=CGRectMake(sp, 0, wh, wh);
    
    
    self.nameL.font=[UIFont systemFontOfSize:14];
    
    self.nameL.textAlignment=NSTextAlignmentCenter;
    
    self.nameL.frame=CGRectMake(0, wh+sp, self.width, 10);
}
@end
