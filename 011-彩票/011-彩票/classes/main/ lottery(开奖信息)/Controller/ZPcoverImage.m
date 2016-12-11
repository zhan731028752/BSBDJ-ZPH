//
//  ZPcoverImage.m
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPcoverImage.h"

@implementation ZPcoverImage

- (void)hiddenCoverImageAndCoverViewWithCompletion:(void(^)())completionBlock
{
    [UIView animateWithDuration:0.6 animations:^{
        self.center=CGPointMake(0, 44);
        
        self.transform=CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        if(completionBlock)
        {
          completionBlock();
        }
    }];
    
}

+(instancetype)coverImage
{

    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;

}

- (IBAction)closeBtnClick:(UIButton *)sender
{
    
    if ([self.delegate  respondsToSelector:@selector(coverImageDidClickClose:)])
    {
        
        [self.delegate coverImageDidClickClose:self];
    }
    
}

+(instancetype)showCoverImageToPoint:(CGPoint)point
{
    ZPcoverImage *coverImage=[ZPcoverImage coverImage];
    
    [[UIApplication sharedApplication].keyWindow addSubview:coverImage];
    coverImage.center=point;
    return coverImage;
}


@end
