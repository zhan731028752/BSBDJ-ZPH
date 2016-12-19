//
//  ZPAllTableViewCell.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/12.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPAllTableViewCell.h"
#import "ZPTopView.h"
#import "ZPMidView.h"
#import "ZPEssenceItem.h"
@interface ZPAllTableViewCell ()

@property(nonatomic,weak)ZPTopView  *topView;

@property(nonatomic,weak)ZPMidView  *midView;
@end


@implementation ZPAllTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        ZPTopView  *topView=[ZPTopView topView];
        self.topView=topView;
        [self.contentView addSubview:topView];
        
        
        ZPMidView  *midView=[ZPMidView midView];
        [self.contentView addSubview:midView];
        self.midView=midView;
        
    }
    return self;
}

-(void)setEssenceItem:(ZPEssenceItem *)essenceItem
{
    _essenceItem=essenceItem;


     self.topView.essenceItem=essenceItem;
   self.topView.frame=essenceItem.topViewF;
    
    
    
    self.midView.frame=essenceItem.midViewF;
    self.midView.item=essenceItem.item;
    
}



@end
