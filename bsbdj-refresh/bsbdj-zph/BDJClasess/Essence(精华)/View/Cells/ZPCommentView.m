//
//  ZPCommentView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/15.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPCommentView.h"
#import "ZPCommentItem.h"
#import "ZPTopItem.h"
@interface   ZPCommentView()

@property(nonatomic,weak)UILabel  *hottestlal;

@property(nonatomic,weak)UILabel *contentlal;

@property(nonatomic,weak)UILabel *uselal;

@property(nonatomic,weak)UIButton *viceBtn;

@property(nonatomic,weak)UIView *v;

@end
@implementation ZPCommentView

+ (instancetype)commentView
{
    ZPCommentView  *cv=[[ZPCommentView alloc]init];
    
    [cv commentViewaddChildControls];
    
    
    
    return cv;
}


-  (void)commentViewaddChildControls
{
    //添加最热评论lal
    UILabel  *hottestlal=[[UILabel alloc]init];
    hottestlal.text=@"最热评论";
    self.hottestlal=hottestlal;
    [self addSubview:hottestlal];
    
    //文字的评论内容lal
    UILabel *contentlal=[[UILabel alloc]init];
    self.contentlal=contentlal;
    contentlal.numberOfLines=0;
    contentlal.font=[UIFont systemFontOfSize:14];
    [self addSubview:contentlal];
    
    UIView *v=[[UIView alloc]init];
    //添加用户名称lal
    UILabel *uselal=[[UILabel alloc]init];
    self.uselal=uselal;
    [v addSubview:uselal];
    
    
    //评价语音的按钮
    UIButton *viceBtn=[[UIButton alloc]init];
    self.viceBtn=viceBtn;
    [viceBtn setImage:[UIImage imageNamed:@"play-voice-stop"] forState:UIControlStateNormal];
    [viceBtn setBackgroundImage:[UIImage imageNamed:@"play-voice-bg"] forState:UIControlStateNormal];
    [viceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viceBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    [viceBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -5)];
    self.v=v;
    [v addSubview:viceBtn];
    [self addSubview:v];
}

//设置数据
- (void)setCommentItem:(ZPCommentItem *)commentItem
{
    _commentItem=commentItem;
    
    if(commentItem.cmt_type==TopicMidTypeMusic)
    {
       
        self.uselal.text=commentItem.user.username;
        self.v.hidden=NO;
        self.contentlal.hidden=YES;
        CGFloat min=commentItem.voicetime/60;
        CGFloat sec=commentItem.voicetime%60;
        NSString  *title=[NSString stringWithFormat:@"%02.lf:%02.lf",min,sec];
        [self.viceBtn setTitle:title forState:UIControlStateNormal];
       
    }else{
        
      
        self.contentlal.text=commentItem.allcontent;
        self.v.hidden=YES;
        self.contentlal.hidden=NO;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat viewW=self.width;
    CGFloat viewH=self.hight;
    
    self.hottestlal.frame=CGRectMake(0, 0, viewW*0.4, 20);
    
    //设置评论文字的尺寸
    CGFloat  contentlalY=viewH*0.4+5;
    NSMutableDictionary  *dict=[NSMutableDictionary dictionary];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    CGFloat contentlalH= [self.commentItem.content boundingRectWithSize:CGSizeMake(viewW, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    self.contentlal.frame=CGRectMake(0, contentlalY, viewW, contentlalH);
    
    self.v.frame=CGRectMake(0, contentlalY, viewW, viewH*0.5);
    
    self.uselal.frame=CGRectMake(0, 0, 80, viewH*0.5);
    
    self.viceBtn.frame=CGRectMake(80, 0, 80, viewH*0.5);
    
    
}
@end
