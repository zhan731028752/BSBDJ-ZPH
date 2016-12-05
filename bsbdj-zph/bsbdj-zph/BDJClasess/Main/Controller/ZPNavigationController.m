//
//  ZPNavigationController.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPNavigationController.h"
#import "ZPNavBar.h"
@interface ZPNavigationController ()

@end

@implementation ZPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZPNavBar  *bar=[[ZPNavBar alloc]init];
    //bar.frame=self.navigationBar.bounds;
    [self setValue:bar forKey:@"navigationBar"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)load
{
    UINavigationBar *bar=[UINavigationBar appearance];
    
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    dictM[NSFontAttributeName]=[UIFont boldSystemFontOfSize:18];
    [bar  setTitleTextAttributes:dictM];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics: UIBarMetricsDefault];
   
}
@end
