//
//  ZPcoverImage.h
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZPcoverImage;

@protocol ZPcoverImageDelegate <NSObject>

@optional

- (void)coverImageDidClickClose:(ZPcoverImage *)coverImage;
@end
@interface ZPcoverImage : UIView

- (void)hiddenCoverImageAndCoverViewWithCompletion:(void(^)())completionBlock;

+(instancetype)showCoverImageToPoint:(CGPoint)point;

@property(nonatomic,weak)id <ZPcoverImageDelegate> delegate;

@end
