//
//  ZPpurViewController.m
//  011-彩票
//
//  Created by admin on 16/11/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPpurViewController.h"
#import "ZPCoverView.h"
#import "ZPcoverImage.h"

@interface ZPpurViewController ()<ZPcoverImageDelegate>
@end

@implementation ZPpurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpNav
{
    UIButton *btn=[[UIButton alloc]init];
    btn.adjustsImageWhenHighlighted=NO;
    
    [btn  setImage:[UIImage imageWithRendeOriginalModeName:@"CS50_activity_image"] forState:UIControlStateNormal];
    
    [btn sizeToFit];
    
    [btn addTarget:self action:@selector(showCover:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView  *contentV=[[UIView alloc]initWithFrame:btn.bounds];
    [contentV addSubview:btn];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView: contentV];
    

}

- (void)showCover:(UIButton *)btn
{
    [ZPCoverView show];
    
    CGFloat X=[UIScreen mainScreen].bounds.size.width*0.5;
    CGFloat y=[UIScreen mainScreen].bounds.size.height*0.5;
    
    ZPcoverImage *coverImage=[ZPcoverImage showCoverImageToPoint:CGPointMake(X, y)];
    
    coverImage.delegate=self;
    
}

-(void)coverImageDidClickClose:(ZPcoverImage *)coverImage
{

[coverImage hiddenCoverImageAndCoverViewWithCompletion:^{
    [ZPCoverView hidden];
}];

}
@end
