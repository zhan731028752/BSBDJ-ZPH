//
//  ZPAreanNavController.m
//  011-彩票
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPAreanNavController.h"

@interface ZPAreanNavController ()

@end

@implementation ZPAreanNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{

  UINavigationBar *navBar=[UINavigationBar appearanceWhenContainedIn:self, nil];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics: UIBarMetricsDefault];

}
@end
