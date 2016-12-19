//
//  ZPCommentView.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/15.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPCommentItem;
@interface ZPCommentView : UIView


+ (instancetype)commentView;

@property(nonatomic,strong)ZPCommentItem *commentItem;
@end
