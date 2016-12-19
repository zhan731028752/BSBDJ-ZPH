//
//  ZPMidView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPMidView.h"
#import "ZPTopItem.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
@interface ZPMidView()

@property(nonatomic,weak)UIView *progressV;

@property(nonatomic,weak) UIImageView  *iconImage;

@property(nonatomic,weak) UIImageView *picImageView;

@property(nonatomic,weak) UIImageView *gifImageView;

@property(nonatomic,weak) UIButton *btn;

@end
@implementation ZPMidView

+(instancetype)midView
{
    ZPMidView  *mv=[[ZPMidView alloc]init];
    
    [mv midViewaddChildControls];
    
    return mv;
}

- (void)midViewaddChildControls
{
    
    
  //创建进度view
    UIView *progressV=[[UIView alloc]init];
    self.progressV=progressV;
     [self addSubview:progressV];
    
    //创建bs图标的图片
    UIImageView   *iconImage=[[UIImageView alloc]init];
    self.iconImage=iconImage;
    iconImage.image=[UIImage imageNamed:@"imageBackground"];
    [self addSubview:iconImage];
    
    
    //创建插图
    UIImageView *picImageView=[[UIImageView alloc]init];
    self.picImageView=picImageView;
    [self addSubview:picImageView];
    
    
   //创建gif
   UIImageView *gifImageView=[[UIImageView alloc]init];
    self.gifImageView=gifImageView;
    gifImageView.image=[UIImage imageNamed:@"common-gif"];
       [self addSubview:gifImageView];
    
   
    //创建大图点击按钮
    UIButton *btn=[[UIButton alloc]init];
    self.btn=btn;
    [btn setImage:[UIImage imageNamed:@"see-big-picture"] forState:UIControlStateNormal];
    [btn setTitle:@"点击查看大图" forState:UIControlStateNormal];
    [self addSubview:btn];
    
  
    [btn setBackgroundImage:[UIImage imageNamed:@"see-big-picture-background"] forState:UIControlStateNormal];
}



//设置数据
-(void)setItem:(ZPTopItem *)item
{
    _item=item;
    
    
    UIImage *image=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:item.image0];
    
    if (image&&(image.size.width<=ScreenW-20)) {
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    }else{
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:item.image0] placeholderImage:nil options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
         if (expectedSize<=0)   return ;
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!item.isbigPic)  return ;
        if (!image)   return;
        
        CGFloat imageW=ScreenW-20;
        CGFloat imageH=imageW/item.width*item.height;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0);
        
        
        [image drawInRect:CGRectMake(0, 0,imageW, imageH)];
         
         
    UIImage  *newImage=UIGraphicsGetImageFromCurrentImageContext();
        
        
        self.picImageView.image=newImage;
        
    }];
    

    }
    self.gifImageView.hidden=!item.is_gif;
    
    self.btn.hidden=!item.isbigPic;
    
    if (item.isbigPic) {
        
        self.picImageView.contentMode= UIViewContentModeTop;
        
        self.picImageView.clipsToBounds=YES;
        
    }else{
    
        self.picImageView.contentMode= UIViewContentModeScaleToFill;
        
        self.picImageView.clipsToBounds=NO;

    
    }
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat viewW=self.width;
    CGFloat viewH=self.hight;
    CGFloat progressVX=viewW*0.5;
     
    self.iconImage.frame=CGRectMake(progressVX,10, 150, 30);
    self.iconImage.centerX=progressVX;
    self.picImageView.frame=CGRectMake(0, 0, viewW, viewH);
    
    self.gifImageView.frame=CGRectMake(0, 0, 50, 50);
    
    self.btn.frame=CGRectMake(0, viewH-30, viewW, 30);
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
