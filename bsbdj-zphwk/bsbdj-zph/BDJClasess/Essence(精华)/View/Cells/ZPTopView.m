//
//  ZPTopView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTopView.h"
#import "ZPTopItem.h"
#import "ZPEssenceItem.h"
#import <UIImageView+WebCache.h>


@interface ZPTopView ()

@property(nonatomic,weak)UIImageView *cdn_imgImageV;

@property(nonatomic,weak)UILabel *nameLabel;

@property(nonatomic,weak)UILabel *textLabe;

@property(nonatomic,weak)UILabel *passtimeL;

@property(nonatomic,weak)UIImageView *weixin_urlImageV;

@property(nonatomic,weak)UIImageView *profile_imageView;

@end
@implementation ZPTopView



+(instancetype)topView
{
    ZPTopView  *tv=[[ZPTopView alloc]init];
    
    [tv topViewaddChildControls];
 
    return tv;
}

- (void)topViewaddChildControls
{
    //创建昵称
    UILabel  *nameLabel=[[UILabel alloc]init];
    self.nameLabel=nameLabel;
    [self addSubview:nameLabel];

    
    //创建图标
    UIImageView *picimageView=[[UIImageView alloc]init];
    self.profile_imageView=picimageView;
    [self addSubview:picimageView];
   
    
    //创建时间
    UILabel  *passtimeL=[[UILabel alloc]init];
    self.passtimeL=passtimeL;
    passtimeL.font=[UIFont systemFontOfSize:14];
    [self addSubview:passtimeL];
    
    
    //创建标题
UILabel  *textLabel=[[UILabel alloc]init];
    textLabel.numberOfLines=0;
    self.textLabe=textLabel;
    textLabel.font=[UIFont systemFontOfSize:13];
    [self addSubview:textLabel];
//    
//    //创建正文
//    UIImageView *cdn_imgImageV=[[UIImageView alloc]init];
//    self.cdn_imgImageV=picimageView;
//    
//    [self addSubview:cdn_imgImageV];
    
    
}


//设置数据
-(void)setEssenceItem:(ZPEssenceItem *)essenceItem
{
    _essenceItem=essenceItem;

    self.nameLabel.text=essenceItem.item.name;
    self.passtimeL.text=essenceItem.item.passtime;
    self.textLabe.text=essenceItem.item.text;
    
    [self.profile_imageView sd_setImageWithURL:[NSURL URLWithString:essenceItem.item.cdn_img]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        
        UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width , image.size.height)];
        
        [path addClip];
        
        [image drawAtPoint:CGPointZero];
        
        UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        self.profile_imageView.image=newImage;
        
    }];
    

    
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cdn_imgImageV.frame=self.essenceItem.cdn_imgF;
    
    self.profile_imageView.frame=self.essenceItem.profile_imageF;
    
    self.nameLabel.frame=self.essenceItem.nameF;
    
    
    self.textLabe.frame=self.essenceItem.textF;
    
    self.passtimeL.frame=self.essenceItem.passtimeF;
    
    //    self.profile_imageView.layer.cornerRadius=self.size.width;
    //    [self.profile_imageView.layer masksToBounds];
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
