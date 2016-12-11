//
//  UIImage+ZP.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "UIImage+ZP.h"

@implementation UIImage (ZP)

+ (instancetype)imageWithRenderOriginalModeName:(NSString*)imageName
{
    UIImage *image=[UIImage imageNamed:imageName];
   return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}



+ (UIImage *)resizingImageWithName:(NSString *)imageName
{
    // 1.创建图片
    UIImage *image = [UIImage imageNamed:imageName];
    
    // 2.找到可以拉伸的区域
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    
    // 3.创建可以拉伸的图片
    //    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5, imageW * 0.5) resizingMode:UIImageResizingModeTile];
    UIImage *resizingImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5, imageW * 0.5) resizingMode:UIImageResizingModeTile];
    
    return resizingImage;
}

@end
