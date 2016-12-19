//
//  ZPLogonRegView.m
//  bsbdj-zph
//
//  Created by admin on 16/12/8.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPLogonRegView.h"
#import "ZPTextField.h"
@interface ZPLogonRegView ()



@property (weak, nonatomic) IBOutlet UIButton *logonBtn;
@property (weak, nonatomic) IBOutlet UIButton *regBtn;

@end
@implementation ZPLogonRegView


+ (instancetype)logRegView
{

    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;

}

+ (instancetype)RegView
{
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    
}
- (void)awakeFromNib
{
   [super awakeFromNib];
    
   UIImage *imageBg=[UIImage resizingImageWithName:@"loginBtnBg"];
    [self.logonBtn setBackgroundImage:imageBg forState:UIControlStateNormal];
    
UIImage *imageBgClick=[UIImage resizingImageWithName:@"loginBtnBgClick"];
    
   [self.logonBtn setBackgroundImage:imageBgClick forState:UIControlStateHighlighted];

    
    
    
    
    UIImage *regImageBg=[UIImage resizingImageWithName:@"login_register_button"];
    
    [self.regBtn setBackgroundImage:regImageBg forState:UIControlStateNormal];
    
    UIImage *regImageBgClick=[UIImage resizingImageWithName:@"login_register_button_click"];
    
    [self.regBtn setBackgroundImage:regImageBgClick forState:UIControlStateHighlighted];
    

    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
   

}
@end
