//
//  ZPFastLogonBtn.m
//  bsbdj-zph
//
//  Created by admin on 16/12/8.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPFastLogonBtn.h"

@implementation ZPFastLogonBtn


- (void)layoutSubviews
{

    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGPoint ceter=self.imageView.center;
    
    ceter.x=self.width*0.5;
    
    self.imageView.center=ceter;
    
    self.imageView.y=0;
    
    self.titleLabel.center=ceter;
    
    self.titleLabel.y=CGRectGetMaxY(self.imageView.frame);

}
//-(CGRect)titleRectForContentRect:(CGRect)contentRect
//-(CGRect)imageRectForContentRect:(CGRect)contentRect
@end
