//
//  ZPAreanViewController.m
//  011-彩票
//
//  Created by admin on 16/11/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPAreanViewController.h"
#import "ZPArenaV.h"
@interface ZPAreanViewController ()

@end

@implementation ZPAreanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       [self setUpNav];
}

-(void)loadView
{
    ZPArenaV  *arenaV=[[ZPArenaV alloc]init];
    self.view=arenaV;



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpNav
{
    
    UISegmentedControl *segControl=[[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    //默认选择0
    segControl.selectedSegmentIndex=0;
    
    //正常时候的背景
    [segControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //选中时候的背景
    [segControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segControl sizeToFit];
    
    //设置主题颜色
    segControl.tintColor=[UIColor colorWithRed:0 green:142.0/255 blue:143.0/255 alpha:1];
    
    //设置选中状态字体的颜色
    [segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    self.navigationItem.titleView=segControl;

}
@end
