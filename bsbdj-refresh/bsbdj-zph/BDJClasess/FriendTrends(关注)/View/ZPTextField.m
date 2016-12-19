//
//  ZPTextField.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/10.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTextField.h"

@interface ZPTextField()

@end
@implementation ZPTextField

-(void)awakeFromNib
{

    [super awakeFromNib];
    //设置自己是自己的代理会报错
    //self.delegate=self;
     //改变光标和输入文字的颜色
    self.textColor=[UIColor whiteColor];
    
    self.tintColor=[UIColor whiteColor];
    
    self.attributedPlaceholder=[NSAttributedString attributedStringWithPlaceholder:self.placeholder color:[UIColor lightGrayColor]];
}




-(BOOL)becomeFirstResponder
{
    
    self.attributedPlaceholder=[NSAttributedString attributedStringWithPlaceholder:self.placeholder color:[UIColor whiteColor]];
    return [super becomeFirstResponder];
}

-(BOOL)resignFirstResponder
{
    
      self.attributedPlaceholder=[NSAttributedString attributedStringWithPlaceholder:self.placeholder color:[UIColor lightGrayColor]];


    return [super resignFirstResponder];
}

@end
