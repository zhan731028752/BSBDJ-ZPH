//
//  ZPFastLogonV.m
//  bsbdj-zph
//
//  Created by admin on 16/12/8.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPFastLogonV.h"

@implementation ZPFastLogonV


+ (instancetype)fastLogonV
{
       return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;


}

@end
