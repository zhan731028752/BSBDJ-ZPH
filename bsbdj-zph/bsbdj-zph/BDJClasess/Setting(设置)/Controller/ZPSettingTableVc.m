//
//  ZPSettingTableVc.m
//  bsbdj-zph
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPSettingTableVc.h"
#import "ZPBackView.h"
@interface ZPSettingTableVc ()

@end

@implementation ZPSettingTableVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}

//设置导航条
- (void)setUpNav
{
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:[ZPBackView backViewWithNormalName:@"navigationButtonReturn"  HighlightN:@"navigationButtonReturn" title:@"返回" target:self action:@selector(back)]];

}

-(void)back
{

    NSLog(@"%s",__func__);
}

@end
