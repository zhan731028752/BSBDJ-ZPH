//
//  ZPMidVoiceView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPMidVoiceView.h"

#import "ZPTopItem.h"
#import <UIImageView+WebCache.h>
@interface ZPMidVoiceView()

@property(nonatomic,weak)UIImageView   *voiceImageView;

@property(nonatomic,weak) UIButton *playBtn;

@property(nonatomic,weak) UILabel *countl;

@property(nonatomic,weak) UILabel *countTime;
@end

@implementation ZPMidVoiceView

//创建音频视图
+ (instancetype)midVoiceView
{
    
    ZPMidVoiceView  *voiceView=[[ZPMidVoiceView alloc]init];
    
    [voiceView midvoiceViewaddChildControls];
    
    return voiceView;
    
    
}

//添加视频视图的子控件
- (void)midvoiceViewaddChildControls
{
    //添加音频的图片
    UIImageView   *voiceImageView=[[UIImageView alloc]init];
    self.voiceImageView=voiceImageView;
    [self addSubview:voiceImageView];
    
    
    //添加音频的播放按钮
    UIButton *playBtn=[[UIButton alloc]init];
    self.playBtn=playBtn;
    [playBtn setImage:[UIImage imageNamed:@"playButtonPlay"] forState:UIControlStateNormal];
    [playBtn setBackgroundImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateNormal];
    [playBtn setBackgroundImage:[UIImage  imageNamed:@"playButtonClick"]  forState:UIControlStateHighlighted];
    
    [self addSubview:playBtn];
    
    //添加音频的播放次数lal
    UILabel *countl=[[UILabel alloc]init];
    self.countl=countl;
    countl.textColor=[UIColor whiteColor];
    countl.font=[UIFont systemFontOfSize:14];
    [self addSubview:countl];
    
    //创建音频的播放时间的lal
    
    UILabel *countTime=[[UILabel alloc]init];
    self.countTime=countTime;
    countTime.textColor=[UIColor whiteColor];
     countTime.font=[UIFont systemFontOfSize:14];
    [self addSubview:countTime];
    
    
}


//设置数据
- (void)setItem:(ZPTopItem *)item
{
    _item=item;
    [self.voiceImageView  sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    
    CGFloat min=item.voicetime/60;
    CGFloat sec=item.voicetime%60;
    NSString *time=[NSString stringWithFormat:@"%02.lf:%02.lf",min,sec];
    
    self.countTime.text=time;
//    self.countTime.font=[UIFont systemFontOfSize:14];
    
    self.countl.text=[NSString stringWithFormat:@"%zd播放",item.playcount];
    self.countl.font=[UIFont systemFontOfSize:14];
    
}





-(void)layoutSubviews
{
    CGFloat viewW=self.width;
    CGFloat viewH=self.hight;
    
    self.voiceImageView.frame=CGRectMake(0, 0, viewW, viewH);
    
    //设置播放按钮的frame
    self.playBtn.frame=CGRectMake(0, 0, viewW*0.25, viewW*0.25);
    self.playBtn.centerX=viewW*0.5;
    self.playBtn.centerY=viewH*0.5;
    
    
    //设置播放时间lal的frame
    CGFloat countTimeW=45;
    CGFloat countTimeH=21;
    CGFloat vcountTimeX=viewW-countTimeW;
    CGFloat countTimeY=viewH-countTimeH;
    self.countTime.frame=CGRectMake(vcountTimeX, countTimeY, countTimeW, countTimeH);
    
    
    //添加播放次数lal的frame
    
    self.countl.text=[NSString stringWithFormat:@"%zd播放",self.item.playcount];
    
    CGSize size=[self.countl.text sizeWithFont:[UIFont systemFontOfSize:14]];
    CGFloat countlX=viewW-size.width;
    
    self.countl.frame=CGRectMake(countlX, 0, size.width, size.height);
    
    
    
}


@end
