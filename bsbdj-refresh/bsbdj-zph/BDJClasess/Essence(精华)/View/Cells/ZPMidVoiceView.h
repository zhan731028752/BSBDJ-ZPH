//
//  ZPMidVoiceView.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPTopItem;
@interface ZPMidVoiceView : UIView

+ (instancetype)midVoiceView;

@property(nonatomic,strong)ZPTopItem *item;

@end
