//
//  ZPEssenceVC.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPEssenceVC.h"
#import "AllcontrollerVC.h"
#import "VideocontrollerVC.h"
#import "SoundcontrollerVC.h"
#import "PiccontrollerVC.h"
#import "CrossControllerVC.h"
@interface ZPEssenceVC ()

@property(nonatomic,weak)UIButton *selectBtn;

@property(nonatomic,weak)UICollectionView  *collectionView;

@property(nonatomic,strong)NSMutableArray *arrBtns;

@property(nonatomic,weak)UIView *lineV;
@end

static NSString * const ID=@"CELL";
@implementation ZPEssenceVC

-(NSMutableArray *)arrBtns
{
    if (_arrBtns==nil) {
        _arrBtns=[NSMutableArray array];
    }
    return _arrBtns;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    [self setUpNav];
    
    //添加所有的子控制器
//    [self addAllChildController];
    
      
}

- (void)addAllChildController
{
    
    //添加全部
    AllcontrollerVC  *vc1=[[AllcontrollerVC alloc]init];
    vc1.title=@"全部";
        
    [self addChildViewController:vc1];
    
    //添加视频
    VideocontrollerVC  *vc2=[[VideocontrollerVC alloc]init];
    vc2.title=@"视频";
    
    [self addChildViewController:vc2];
    
    //添加声音
    SoundcontrollerVC  *vc3=[[SoundcontrollerVC alloc]init];
    vc3.title=@"声音";
   // vc3.view.backgroundColor=[UIColor grayColor];
    [self addChildViewController:vc3];
    
    //添加图片
    PiccontrollerVC  *vc4=[[PiccontrollerVC alloc]init];
    vc4.title=@"图片";
    [self addChildViewController:vc4];
    
    //添加段子
    CrossControllerVC  *vc5=[[CrossControllerVC alloc]init];
    vc5.title=@"段子";
    //vc5.view.backgroundColor=[UIColor blueColor];
    [self addChildViewController:vc5];
    
    
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
    
    
    
}

- (void)randomBtnClick:(UIButton *)randomBtn
{
    
    
    
}

@end
