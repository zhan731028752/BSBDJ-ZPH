//
//  ZPFriendTreandsVC.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPFriendTreandsVC.h"

@interface ZPFriendTreandsVC ()

@end

@implementation ZPFriendTreandsVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor yellowColor];
    [self setUpNav];
}

//设置导航条
-(void)setUpNav
{
    
    //设置中间视图
    self.navigationItem.title=@"我的关注";
    
    //设置导航条左侧
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem BarButtonItemWithNormalName:@"friendsRecommentIcon" HighlightN:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecommentBtnClick:)];
}


- (void)friendsRecommentBtnClick:(UIButton *)btn
{
    
   
}

@end
