//
//  NSAttributedString+ZPAttribute.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/10.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (ZPAttribute)

/**
 
在对textfield进行编译的时候，返回一个占位字符的颜色属性
 */

+ (NSAttributedString *)attributedStringWithPlaceholder:(NSString *)placeholder color:(UIColor*)color;

@end
