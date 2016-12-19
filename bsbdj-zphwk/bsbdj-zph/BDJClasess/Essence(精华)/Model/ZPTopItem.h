//
//  ZPAllItem.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/12.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

//1为全部，10为图片，29为段子，31为音频，41为视频，默认为
typedef enum : NSUInteger {
    TopicMidTypePicture = 10,
    TopicMidTypeVideo = 41,
    TopicMidTypeMusic = 31,
    TopicMidTypeText = 29,
    TopicMidTypeAll = 1
} TopicMidType;
@interface ZPTopItem : NSObject


@property(nonatomic,strong)NSString *cdn_img;

@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *text;

@property(nonatomic,strong)NSString *passtime;

@property(nonatomic,strong)NSString *weixin_url;

@property(nonatomic,strong)NSString *profile_image;

@property(nonatomic,assign)BOOL  is_gif;

@property(nonatomic,strong)NSString *image0;

@property(nonatomic,strong)NSString *image1;

@property(nonatomic,strong)NSString *image2;

@property(nonatomic,assign)CGFloat  width;

@property(nonatomic,assign)CGFloat height;

@property(nonatomic,assign)NSInteger type;


@property(nonatomic,assign)BOOL isbigPic;
@end
