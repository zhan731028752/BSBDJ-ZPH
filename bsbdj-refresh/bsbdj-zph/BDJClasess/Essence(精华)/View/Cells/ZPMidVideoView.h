//
//  ZPMidVideoView.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPTopItem;
@interface ZPMidVideoView : UIView

@property(nonatomic,strong)ZPTopItem  *item;


+ (instancetype)midVideoView;

@end
