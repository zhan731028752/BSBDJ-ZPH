//
//  ZPNavViewController.m
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPNavViewController.h"

@interface ZPNavViewController ()

@end

@implementation ZPNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)load
{
    //只有是当前类才初始化
    if(self==[ZPNavViewController class]){
    UINavigationBar *bar=[UINavigationBar appearanceWhenContainedIn:self, nil];
    //改变字体的颜色大小
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    
    dictM[NSFontAttributeName]=[UIFont boldSystemFontOfSize:20];
    dictM[NSForegroundColorAttributeName]=[UIColor whiteColor];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置文字的颜色
    [bar setTitleTextAttributes:dictM];
    }

}
@end
