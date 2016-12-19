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
#import "ZPMidVideoView.h"
#import "ZPMidVoiceView.h"
#import "ZPTopItem.h"
#import "ZPCommentView.h"
#import "ZPBottomView.h"
@interface ZPAllTableViewCell ()

@property(nonatomic,weak)ZPTopView  *topView;

@property(nonatomic,weak)ZPMidView  *midView;

@property(nonatomic,weak)ZPMidVideoView *videoView;

@property(nonatomic,weak)ZPMidVoiceView *voiceView;

@property(nonatomic,weak)ZPCommentView  *commentView;

@property(nonatomic,weak)ZPBottomView   *bottomView;



@end


@implementation ZPAllTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //设置cell的背景图片
        //设置cell背景
        UIImageView* bacView = [[UIImageView alloc ] initWithFrame:self.bounds];
        UIImage* image =[UIImage imageNamed:@"mainCellBackground"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
        bacView.image = image;
        [self setBackgroundView:bacView];
        
        
        
        //添加上面的view
        ZPTopView  *topView=[ZPTopView topView];
        self.topView=topView;
        [self.contentView addSubview:topView];
        
        //添加中间的图片
        ZPMidView  *midView=[ZPMidView midView];
        [self.contentView addSubview:midView];
        self.midView=midView;
        
        
        //添加中间视频的vIEW
        ZPMidVideoView *videoView=[ZPMidVideoView  midVideoView];
        [self.contentView addSubview:videoView];
        self.videoView=videoView;
        
        
        //添加中间音频的vIEW
        ZPMidVoiceView *voiceView=[ZPMidVoiceView  midVoiceView];
        [self.contentView addSubview:voiceView];
        self.voiceView=voiceView;
        
        //添加点评view
        ZPCommentView  *commentView=[ZPCommentView commentView];
        [self.contentView addSubview:commentView];
        self.commentView=commentView;
        
        
        //添加底部的view
        ZPBottomView   *bottomView=[ZPBottomView bottomView];
        [self.contentView addSubview:bottomView];
        self.bottomView=bottomView;
    }
    return self;
}

-(void)setEssenceItem:(ZPEssenceItem *)essenceItem
{
    _essenceItem=essenceItem;
    
    //设置顶部view的数据和尺寸
    self.topView.essenceItem=essenceItem;
    self.topView.frame=essenceItem.topViewF;
    
    
    //设置中间图片view的数据和尺寸
    self.midView.frame=essenceItem.midViewF;
    self.midView.item=essenceItem.item;
    
    
    //设置中间视频频view的数据和尺寸
    self.videoView.frame=essenceItem.midViewF;
    self.videoView.item=essenceItem.item;
    
    //设置中间音频view的数据和尺寸
    self.voiceView.frame=essenceItem.midViewF;
    self.voiceView.item=essenceItem.item;
    
    //设置点评的数据和尺寸
    self.commentView.frame=essenceItem.contentViewF;
    self.commentView.commentItem=essenceItem.item.commentItem;
    
    //设置底部的view的数据和尺寸
    self.bottomView.topItem=essenceItem.item;
    self.bottomView.frame=essenceItem.bottomViewF;
    //控制视图是否显示
    if(essenceItem.item.type==TopicMidTypeVideo)
    {
        
        self.midView.hidden=YES;
        self.videoView.hidden=NO;
        self.voiceView.hidden=YES;
        
    }else if(essenceItem.item.type==TopicMidTypeMusic)
    {
        self.midView.hidden=YES;
        self.videoView.hidden=YES;
        self.voiceView.hidden=NO;
        
    }else if(essenceItem.item.type==TopicMidTypePicture)
    {
        self.midView.hidden=NO;
        self.videoView.hidden=YES;
        self.voiceView.hidden=YES;
        
        
    }else{
        
        self.midView.hidden=YES;
        self.videoView.hidden=YES;
        self.voiceView.hidden=YES;
        
    }
    
}


-(void)setFrame:(CGRect)frame
{
    frame.size.height-=10;
    frame.origin.y+=10;
    [super setFrame:frame];
    
}

@end
