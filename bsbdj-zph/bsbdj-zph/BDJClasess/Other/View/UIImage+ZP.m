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
@end
