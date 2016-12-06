//
//  ZPTabBaViewController.m
//  011-彩票
//
//  Created by admin on 16/11/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTabBaViewController.h"
#import "ZPMylotteryViewController.h"
#import "ZPpurViewController.h"
#import "ZPDrawViewController.h"
#import "ZPFindViewController.h"
#import "ZPAreanViewController.h"
#import "ZPTabbar.h"
#import "ZPNavViewController.h"
#import "ZPAreanNavController.h"
@interface ZPTabBaViewController ()<ZPTabbarDelegate>
@property(nonatomic,strong)NSMutableArray *itemArray;
@end

@implementation ZPTabBaViewController
-(NSMutableArray *)itemArray{
    if(_itemArray==nil){
        _itemArray=[NSMutableArray array];
    }
    return _itemArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAllChlidview];
    [self setUptabBar];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
//控制器的View即将显示的时候调用该方法
-(void)viewDidAppear:(BOOL)animated
{
    for (UIView *view in self.tabBar.subviews) {
        if(![view isKindOfClass:[ZPTabbar class]])
        {
            [view removeFromSuperview];
        
        }
    }

}
-(void)setUptabBar{
   
//    //移除tabBar
//    [self.tabBar removeFromSuperview];
    ZPTabbar *tabBar=[[ZPTabbar alloc]init];
    tabBar.frame=self.tabBar.frame;
    tabBar.items=self.itemArray;
    tabBar.delegate=self;
    tabBar.backgroundColor=[UIColor redColor];
       [self.view addSubview:tabBar];
    }

-(void)tabbar:(ZPTabbar *)tabbar selIndex:(NSInteger)selIndex{
    self.selectedIndex=selIndex;

}

-(void)addAllChlidview{
    //添加购彩大厅
    ZPpurViewController *ve1=[[ZPpurViewController alloc]init];
    [self addOneChlidView:ve1 image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]title:@"购彩大厅"];
    //添加竞技场
    ZPAreanViewController *ve2=[[ZPAreanViewController  alloc]init];
     [self addOneChlidView:ve2 image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:nil];
   
    //添加发现
    //从Storyboard加载控制器
      UIStoryboard *st=[UIStoryboard storyboardWithName:@"ZPFindViewController" bundle:nil];
    
        //加载StoryBoard当中剪头指向的控制器
       UIViewController *ve3=[st instantiateInitialViewController];
   
     [self addOneChlidView:ve3 image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]title:@"发现"];
    ZPDrawViewController *ve4=[[ ZPDrawViewController alloc]init];
    //添加开奖信息
     [self addOneChlidView:ve4 image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"]title:@"开奖信息"];
    //添加我的彩票
    ZPMylotteryViewController *ve5=[[ZPMylotteryViewController alloc]init];
    [self addOneChlidView:ve5 image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]title:@"我的彩票"];
                                    
}

-(void)addOneChlidView:(UIViewController*)ve  image:(UIImage*)image selImage :(UIImage*)selImage title:(NSString*) title {
    
     UINavigationController *nav=[[ZPNavViewController alloc]initWithRootViewController:ve];
    //竞技场用自己的导航控制器
    if([ve isKindOfClass:[ ZPAreanViewController class]])
    {
     nav=[[ZPAreanNavController alloc]initWithRootViewController:ve];
           }
   
    
    nav.tabBarItem.image=image;
   
    ve.navigationItem.title= title;
    
  nav.tabBarItem.selectedImage=selImage;
    
    [self.itemArray addObject:nav.tabBarItem];
    [self addChildViewController:nav];
   
}
@end
