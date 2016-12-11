//
//  ZPTabbar.h
//  011-彩票
//
//  Created by admin on 16/11/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZPTabbar;
@protocol ZPTabbarDelegate <NSObject>
@optional
-(void)tabbar:(ZPTabbar*)tabbar selIndex:(NSInteger)selIndex;
@end
@interface ZPTabbar : UIView
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,weak)id <ZPTabbarDelegate>delegate;
@end
