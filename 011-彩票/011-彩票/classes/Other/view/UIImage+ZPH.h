//
//  UIImage+ZPH.h
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZPH)

/**
 返回一个不会被渲染的图片
 */
+(UIImage *)imageWithRendeOriginalModeName:(NSString *)imageN;
@end
