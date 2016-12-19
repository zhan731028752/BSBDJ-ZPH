//
//  ZPAllItem.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/12.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZPCommentItem;
@interface ZPTopItem : NSObject

@property(nonatomic,strong)ZPCommentItem  *commentItem;

//公共的数据
@property(nonatomic,strong)NSString *image0;

@property(nonatomic,strong)NSString *image1;

@property(nonatomic,strong)NSString *image2;

@property(nonatomic,assign)CGFloat  width;

@property(nonatomic,assign)CGFloat height;

@property(nonatomic,assign)NSInteger type;

@property(nonatomic,assign)BOOL isbigPic;

@property(nonatomic,assign)BOOL  is_gif;

//图片的数据
@property(nonatomic,strong)NSString *cdn_img;

@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *text;

@property(nonatomic,strong)NSString *passtime;

@property(nonatomic,strong)NSString *create_time;

@property(nonatomic,strong)NSString *weixin_url;

@property(nonatomic,strong)NSString *profile_image;

@property(nonatomic,strong)NSArray *top_cmt;
//视频的数据
//视频播放或者音频的次数
@property(nonatomic,assign)NSInteger playcount;

//视频时间长度
@property(nonatomic,assign)NSInteger videotime;

//音频播放时长
@property(nonatomic,assign)NSInteger voicetime;
//playcount
//videotime

@property(nonatomic,strong)NSString *ding;

@property(nonatomic,strong)NSString * cai;

@property(nonatomic,strong)NSString * repost;

@property(nonatomic,strong)NSString * comment;
@end
