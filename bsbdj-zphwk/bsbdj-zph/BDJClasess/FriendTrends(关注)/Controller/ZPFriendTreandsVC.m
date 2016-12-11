//
//  ZPFriendTreandsVC.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPFriendTreandsVC.h"

#import "ZPLogViewController.h"
@interface ZPFriendTreandsVC ()
@property (weak, nonatomic) IBOutlet UIButton *logonBtn;

@end

@implementation ZPFriendTreandsVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
   // self.view.backgroundColor=[UIColor yellowColor];
    [self setUpNav];
}


- (IBAction)logBtnClick:(id)sender {
    
    
    UIStoryboard *str=[UIStoryboard storyboardWithName:NSStringFromClass([ZPLogViewController class]) bundle:nil];
 UIViewController *vc=[str instantiateInitialViewController];
    
    [self presentModalViewController:vc animated:YES];
    
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
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
