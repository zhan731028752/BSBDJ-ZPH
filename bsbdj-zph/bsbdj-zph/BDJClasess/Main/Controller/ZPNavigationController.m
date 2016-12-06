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
@interface ZPNavigationController ()

@end

@implementation ZPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZPNavBar  *bar=[[ZPNavBar alloc]init];
   [self setValue:bar forKey:@"navigationBar"];
   
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

-(void)back
{
    [self popViewControllerAnimated:YES];
    //NSLog(@"%s",__func__);
}
@end
