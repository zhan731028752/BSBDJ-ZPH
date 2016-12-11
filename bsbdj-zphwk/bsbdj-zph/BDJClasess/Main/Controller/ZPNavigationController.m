//
//  ZPNavigationController.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPNavigationController.h"
#import "ZPNavBar.h"
#import "ZPBackView.h"
@interface ZPNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation ZPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZPNavBar  *bar=[[ZPNavBar alloc]init];
   [self setValue:bar forKey:@"navigationBar"];
   // <UIScreenEdgePanGestureRecognizer: 0x7fb748c56560; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fb748c49c80>; target= <(action=handleNavigationTransition:,
 id  target=self.interactivePopGestureRecognizer.delegate ;
   //NSLog(@"%@",self.interactivePopGestureRecognizer) ;
    //让全屏都有拖拽的效果
    //用边缘拖拽的默认代理,来执行系统的方法
    UIPanGestureRecognizer  *pan=[[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    self.interactivePopGestureRecognizer.enabled=NO;
    pan.delegate=self;
    [self.view addGestureRecognizer:pan];
    //self.interactivePopGestureRecognizer.delegate==
//     NSLog(@"%@",self.interactivePopGestureRecognizer.delegate) ;
}


+ (void)load
{
    UINavigationBar *bar=[UINavigationBar appearance];
    
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    
    dictM[NSFontAttributeName]=[UIFont boldSystemFontOfSize:18];
    
    [bar  setTitleTextAttributes:dictM];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics: UIBarMetricsDefault];

}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   //判断是否是根控制器
    if(self.childViewControllers.count>0)
    {
   viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:[ZPBackView backViewWithNormalName:@"navigationButtonReturn"  HighlightN:@"navigationButtonReturn" title:@"返回" target:self action:@selector(back)]];
        
        viewController.hidesBottomBarWhenPushed=YES;
    
    }
    [super pushViewController:viewController animated:YES];
}

//实现UIGestureRecognizerDelegate代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
     //这些会解除根控制器拖拽后产生假死的bug
    return self.childViewControllers.count>1;


}
-(void)back
{
    [self popViewControllerAnimated:YES];
    //NSLog(@"%s",__func__);
}



@end
