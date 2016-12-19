//
//  ZPBottomView.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/16.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZPTopItem;
@interface ZPBottomView : UIView

+ (instancetype)bottomView;


@property(nonatomic,strong)ZPTopItem  *topItem;
@end
