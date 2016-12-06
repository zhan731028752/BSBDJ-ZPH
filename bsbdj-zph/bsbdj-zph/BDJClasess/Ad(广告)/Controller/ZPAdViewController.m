//
//  ZPAdViewController.m
//  bsbdj-zph
//
//  Created by admin on 16/12/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPAdViewController.h"
#import "ZPTabBarController.h"
#import <AFNetworking.h>
#define iPhone6P  ScreenH == 736
#define iPhone6   ScreenH == 667
#define iPhone5   ScreenH == 568
#define iPhone4   ScreenH == 480

@interface ZPAdViewController ()
@property (weak, nonatomic) IBOutlet UIView *contionV;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageV;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@end

@implementation ZPAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置屏幕适配
    [self setLaunchImageView];
    //设置广告界面
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

//加载数据
- (void)loadData
{



}


//设置屏幕适配
- (void)setLaunchImageView
{
    

    UIImage *image=nil;
    
    if(iPhone6P){
        image=[UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    
    }else if(iPhone6){
    
        image=[UIImage imageNamed:@"LaunchImage-800-667h"];
    
    }else if(iPhone5)
    {
    
    image=[UIImage imageNamed:@"LaunchImage-700-568h"];
    
    }else if(iPhone4)
    {
    
    image=[UIImage imageNamed:@"LaunchImage"];
    
    }

    self.launchImageV.image=image;

}


- (IBAction)adBtnClick {
    
    ZPTabBarController *tarV=[[ZPTabBarController alloc]init];
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController=tarV;
    
}


@end
