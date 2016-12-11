//
//  NSAttributedString+ZPAttribute.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/10.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "NSAttributedString+ZPAttribute.h"

@implementation NSAttributedString (ZPAttribute)


+ (NSAttributedString *)attributedStringWithPlaceholder:(NSString *)placeholder color:(UIColor*)color
{

    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    
    dict[NSForegroundColorAttributeName]=color;
    
    NSAttributedString *attr=[[NSAttributedString alloc]initWithString:placeholder attributes:dict];
    return attr;
}


@end
