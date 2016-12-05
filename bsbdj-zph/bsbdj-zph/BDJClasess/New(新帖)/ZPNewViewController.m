//
//  ZPNewViewController.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPNewViewController.h"

@interface ZPNewViewController ()

@end

@implementation ZPNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor=[UIColor blueColor];
    [self setUpNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//设置导航条
-(void)setUpNav
{
    
    //设置中间视图
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航条左侧
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem BarButtonItemWithNormalName:@"MainTagSubIcon" HighlightN:@"MainTagSubIconClick" target:self action:@selector(TagSubBtnClick:)];
}


- (void)TagSubBtnClick:(UIButton *)btn
{

    NSLog(@"dd");
}
@end
