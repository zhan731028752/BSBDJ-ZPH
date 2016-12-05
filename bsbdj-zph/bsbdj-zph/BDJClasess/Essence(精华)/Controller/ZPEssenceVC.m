//
//  ZPEssenceVC.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPEssenceVC.h"
#import "UIBarButtonItem+ZPItem.h"
@interface ZPEssenceVC ()

@end

@implementation ZPEssenceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
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
   
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem BarButtonItemWithNormalName:@"nav_item_game_iconN" HighlightN:@"nav_item_game_click_iconN" target:self action:@selector(gameBtnClick:)];
    //设置导航条右侧
    
 self.navigationItem.rightBarButtonItem=[UIBarButtonItem BarButtonItemWithNormalName:@"navigationButtonRandomN" HighlightN:@"navigationButtonRandomClickN" target:self action:@selector(randomBtnClick:)];

}

- (void)gameBtnClick:(UIButton *)gameBtn
{

    NSLog(@"%s",__func__);

}

- (void)randomBtnClick:(UIButton *)randomBtn
{

 NSLog(@"%s",__func__);

}

@end
