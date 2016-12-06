//
//  UIImage+ZPH.m
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "UIImage+ZPH.h"

@implementation UIImage (ZPH)


+(UIImage *)imageWithRendeOriginalModeName:(NSString *)imageN
{
    UIImage  *image=[UIImage imageNamed:imageN];
    
   image= [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;

}
@end
