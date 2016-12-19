//
//  ZPCommentItem.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZPUserItem.h"
@interface ZPCommentItem : NSObject
//用户模型
@property(nonatomic,strong)ZPUserItem *user;


//评价的类型是语音还是文字
@property(nonatomic,assign)NSInteger cmt_type;

//评价内容
@property(nonatomic,strong)NSString *content;


//评价的全部内容
@property(nonatomic,strong)NSString *allcontent;


//音频播放时长
@property(nonatomic,assign)NSInteger voicetime;
@end
