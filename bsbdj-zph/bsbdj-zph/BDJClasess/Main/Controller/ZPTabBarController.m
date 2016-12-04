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

@end

@implementation ZPTabBarController
-(UIButton *)publishBtn
{
 if(_publishBtn==nil)
 {
     UIButton *publishBtn=[[UIButton alloc]init];
     
     _publishBtn=publishBtn;
     [self.publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
     [self.publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
     [self.publishBtn sizeToFit];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

//程序已启动把给类加载到内存中
+(void)load
{
    UITabBarItem  *tar=[UITabBarItem appearance];
    
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    
    dictM[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    
   //dictM[NSForegroundColorAttributeName]=[UIColor blackColor];
    
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
    [self addOneChildViewControllerWithVc:vc2 imageName:nil selImage:nil title:nil];
    vc2.tabBarItem.enabled=NO;
   
    //添加关注
    UIViewController  *vc3=[[NSClassFromString(@"ZPFriendTreandsVC") alloc]init];
    [self addOneChildViewControllerWithVc:vc3 imageName:@"tabBar_friendTrends_icon" selImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    
    //添加我的
    UIViewController  *vc4=[[NSClassFromString(@"ZPMineTableVC") alloc]init];
    [self addOneChildViewControllerWithVc:vc4 imageName:@"tabBar_me_icon" selImage:@"tabBar_me_click_icon" title:@"我的"];


}

//添加一个控制器
- (void)addOneChildViewControllerWithVc:(UIViewController *)Vc imageName:(NSString*)imageN selImage:(NSString*)selImage title:(NSString*)title
{

    ZPNavigationController  *nav=[[ZPNavigationController alloc]initWithRootViewController:Vc];
    if(imageN!=nil||selImage!=nil){
    nav.tabBarItem.image=[UIImage imageWithRenderOriginalModeName:imageN];
    
    nav.tabBarItem.selectedImage=[UIImage imageWithRenderOriginalModeName:selImage];
    
    nav.tabBarItem.title=title;
    }
    [self addChildViewController:nav];
    
}


@end
