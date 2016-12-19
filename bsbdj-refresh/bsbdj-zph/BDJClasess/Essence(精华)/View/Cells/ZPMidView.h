//
//  ZPMidView.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZPTopItem;
@interface ZPMidView : UIView

+(instancetype)midView;


@property(nonatomic,strong)ZPTopItem *item;

@end
