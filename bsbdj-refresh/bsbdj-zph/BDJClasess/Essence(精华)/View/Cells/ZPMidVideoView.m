//
//  ZPMidVideoView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPMidVideoView.h"
#import <UIImageView+WebCache.h>
#import "ZPTopItem.h"
@interface ZPMidVideoView ()
@property(nonatomic,weak) UIImageView *videoImage;

@property(nonatomic,weak) UIButton *playBtn;

@property(nonatomic,weak) UILabel *playcountL;

@property(nonatomic,weak) UILabel  *videotimeL;

@end

@implementation ZPMidVideoView

//创建视频视图
+ (instancetype)midVideoView
{
    
    ZPMidVideoView  *videoView=[[ZPMidVideoView alloc]init];
    
    [videoView midVideoViewaddChildControls];
    
    return videoView;
    
    
}
//添加视频视图的子控件
- (void)midVideoViewaddChildControls
{
    //添加图片
    UIImageView *videoImage=[[UIImageView alloc]init];
    self.videoImage=videoImage;
    [self addSubview:videoImage];
    
    //添加播放按钮
    UIButton *playBtn=[[UIButton alloc]init];
    self.playBtn=playBtn;
    [playBtn setImage:[UIImage imageNamed:@"video-play"] forState:UIControlStateNormal];
    [self addSubview:playBtn];
    
    //添加播放时间长度的lal
    UILabel   *videotimeL=[[UILabel alloc]init];
    videotimeL.backgroundColor=[UIColor blackColor];
    videotimeL.textColor=[UIColor whiteColor];
    videotimeL.alpha=0.5;
    self.videotimeL=videotimeL;
    [self addSubview:videotimeL];
    
    //添加播放次数的lal
    UILabel *playcountL=[[UILabel alloc]init];
    self.playcountL=playcountL;
    playcountL.backgroundColor=[UIColor blackColor];
    playcountL.alpha=0.5;
    playcountL.textColor=[UIColor whiteColor];
    [self addSubview:playcountL];
    
    
    
}

- (void)setItem:(ZPTopItem *)item
{
    _item=item;
    [self.videoImage  sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    
    CGFloat min=item.videotime/60;
    CGFloat sec=item.videotime%60;
    NSString *time=[NSString stringWithFormat:@"%02.lf:%02.lf",min,sec];
    
    self.videotimeL.text=time;
    self.videotimeL.font=[UIFont systemFontOfSize:14];
    
    self.playcountL.text=[NSString stringWithFormat:@"%zd播放",item.playcount];
    self.playcountL.font=[UIFont systemFontOfSize:14];
    
}



-(void)layoutSubviews
{
    CGFloat viewW=self.width;
    CGFloat viewH=self.hight;
    CGFloat space=10;
    //设置图片的frame
    self.videoImage.frame=CGRectMake(0, 0, viewW, viewH);
    
    //设置播放按钮的frame
    self.playBtn.frame=CGRectMake(0, 0, viewW*0.25, viewW*0.25);
    self.playBtn.centerX=viewW*0.5;
    self.playBtn.centerY=viewH*0.5;
    
    
    //设置播放时间lal的frame
    CGFloat videotimeW=45;
    CGFloat videotimeH=21;
    CGFloat videotimeX=viewW-videotimeW;
    CGFloat videotimeY=viewH-videotimeH;
 
    self.videotimeL.frame=CGRectMake(videotimeX, videotimeY, videotimeW, videotimeH);
    
    
    //添加播放次数lal的frame
    CGFloat playcountH=21;
    
    self.playcountL.text=[NSString stringWithFormat:@"%zd播放",self.item.playcount];
  CGSize size= [self.playcountL.text sizeWithFont:[UIFont systemFontOfSize:14]];
    CGFloat playcountX=viewW-size.width;
    self.playcountL.frame=CGRectMake(playcountX, 0, size.width, playcountH);
}


@end
