//
//  ZPTabBarController.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTabBarController.h"
#import "ZPNavigationController.h"

@interface ZPTabBarController ()
//发布的按钮
@property(nonatomic,weak) UIButton *publishBtn;

@property(nonatomic,strong)UITabBarItem *selitem;
@end

@implementation ZPTabBarController
-(UIButton *)publishBtn
{
 if(_publishBtn==nil)
 {
     UIButton *publishBtn=[[UIButton alloc]init];
     
     [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
     [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
     
     [publishBtn sizeToFit];
     [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
     _publishBtn=publishBtn;
     [self.tabBar addSubview:publishBtn];
 }
    return _publishBtn;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加所有的子控制器
    [self addAllChildViewController];
    //设置发布按钮的位置
    CGFloat x=self.tabBar.frame.size.width*0.5;
    
    CGFloat y=self.tabBar.frame.size.height*0.5;
    
    self.publishBtn.center=CGPointMake(x, y);
    

    //设置tabBar的背景图片
    self.tabBar.backgroundImage=[UIImage imageNamed:@"tabbar-light"];
     
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if(_selitem==item){
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tabbarBtnClick" object:nil];
    }
    _selitem=item;
       
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //显示完毕让第一个按钮点击一下
    _selitem=self.tabBar.items[0];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

//程序已启动把给类加载到内存中
+(void)load
{
    UITabBarItem  *tar=[UITabBarItem appearance];
   UITabBar  *tar1=[UITabBar appearance];
    tar1.tintColor=[UIColor blackColor];
    
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    
    dictM[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    
    [tar setTitleTextAttributes:dictM forState:UIControlStateNormal];
   
    
    
}

//添加所有的子控制器
-(void)addAllChildViewController
{
   
    
    //添加精华
        UIViewController  *vc0=[[NSClassFromString(@"ZPEssenceVC") alloc]init];
    [self addOneChildViewControllerWithVc:vc0 imageName:@"tabBar_essence_icon" selImage:@"tabBar_essence_click_icon" title:@"精华"];
    
    //添加新帖
    UIViewController  *vc1=[[NSClassFromString(@"ZPNewViewController") alloc]init];
    [self addOneChildViewControllerWithVc:vc1 imageName:@"tabBar_new_icon" selImage:@"tabBar_new_click_icon" title:@"新帖"];
    
    //添加发布
    UIViewController  *vc2=[[NSClassFromString(@"ZPPublishVC") alloc]init];
    [self  addChildViewController:vc2];
    vc2.tabBarItem.enabled=NO;
   
    //添加关注
    UIViewController  *vc3=[[NSClassFromString(@"ZPFriendTreandsVC") alloc]init];
    [self addOneChildViewControllerWithVc:vc3 imageName:@"tabBar_friendTrends_icon" selImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    
    //添加我的
    UIStoryboard *strd=[UIStoryboard storyboardWithName:@"ZPMineTableVC" bundle:nil];
    
   UIViewController  *vc4=[strd instantiateInitialViewController];
    
    [self addOneChildViewControllerWithVc:vc4 imageName:@"tabBar_me_icon" selImage:@"tabBar_me_click_icon" title:@"我的"];


}

//添加一个控制器
- (void)addOneChildViewControllerWithVc:(UIViewController *)Vc imageName:(NSString*)imageN selImage:(NSString*)selImage title:(NSString*)title
{

    ZPNavigationController  *nav=[[ZPNavigationController alloc]initWithRootViewController:Vc];
    

    nav.tabBarItem.image=[UIImage imageWithRenderOriginalModeName:imageN];
    
    nav.tabBarItem.selectedImage=[UIImage imageWithRenderOriginalModeName:selImage];
    
    nav.tabBarItem.title=title;
   
    [self addChildViewController:nav];
    
}


//发布按钮点击调用
-(void)publishBtnClick
{
   
}
@end
