//
//  ZPMineTableVC.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPMineTableVC.h"
#import "ZPSettingTableVc.h"
@interface ZPMineTableVC ()

@end

@implementation ZPMineTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    self.navigationItem.title=@"我的";
    
    //设置导航条右侧
    
    //夜间按钮
    UIBarButtonItem *nightBtn=[UIBarButtonItem BarButtonItemWithNormalName:@"mine-sun-icon" SelectedN: @"mine-sun-icon-click" target:self action:@selector(nightBtnClick)];
    
    //设置按钮
    UIBarButtonItem *settingBtn=[UIBarButtonItem BarButtonItemWithNormalName:@"mine-setting-icon" HighlightN:@"mine-setting-icon-click" target:self action:@selector(settingBtnClick)];
    
    self.navigationItem.rightBarButtonItems=@[settingBtn,nightBtn];
}


- (void)nightBtnClick{
    
    NSLog(@"%s",__func__);
}

-(void)settingBtnClick
{
    ZPSettingTableVc  *vc=[[ZPSettingTableVc alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
