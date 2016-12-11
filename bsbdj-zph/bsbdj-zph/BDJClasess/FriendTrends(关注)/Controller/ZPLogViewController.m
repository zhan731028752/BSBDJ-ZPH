//
//  ZPLogViewController.m
//  bsbdj-zph
//
//  Created by admin on 16/12/7.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPLogViewController.h"
#import "ZPLogonRegView.h"
#import "ZPFastLogonV.h"
@interface ZPLogViewController ()

@property (weak, nonatomic) IBOutlet UIView *inputV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputvX;

@property (weak, nonatomic) IBOutlet UIView *bottomV;

@property (weak, nonatomic) ZPFastLogonV *fastLogonV;


@end

@implementation ZPLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUplogregsInterface];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加注册和登录界面以及快速登录
- (void)setUplogregsInterface
{
   ZPLogonRegView  *logView=[ZPLogonRegView logRegView];
    
     [self.inputV  addSubview:logView];
    
   
    
    ZPLogonRegView  *regView=[ZPLogonRegView RegView];
    
       [self.inputV  addSubview:regView];
//
    ZPFastLogonV *fastLogonV=[ZPFastLogonV fastLogonV];
    
    self.fastLogonV=fastLogonV;
    
    self.fastLogonV.frame=self.bottomV.bounds;

    [self.bottomV addSubview:fastLogonV];
   
}

//注册按钮点击
- (IBAction)registerBtnClick:(UIButton *)sender {
    
    
    sender.selected=!sender.isSelected;
    
     self.inputvX.constant=self.inputvX.constant==0?-ScreenW:0;
 
    [UIView animateWithDuration:0.5 animations:^{
       
        
       [self.view layoutIfNeeded];
    }];
    
}


//关闭按钮点击
- (IBAction)closeBtnClick:(UIButton *)sender {
    
    [self dismissModalViewControllerAnimated:YES];
    [UIView animateWithDuration:0.5 animations:^{
        
    }];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat x=0;
    CGFloat y=0;
    CGFloat w=self.inputV.frame.size.width*0.5;
    CGFloat h=self.inputV.frame.size.height;
    
    for (int i = 0; i < self.inputV.subviews.count; ++i) {
        UIView *view=self.inputV.subviews[i];
        x=i*w;
        //NSLog(@"%zd", self.inputV.subviews.count);
        view.frame=CGRectMake(x, y, w, h);
    }
    self.fastLogonV.frame=self.bottomV.bounds;
    
}
@end
