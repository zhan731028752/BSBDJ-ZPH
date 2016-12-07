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
#import "ZPAdItem.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "AFHTTPSessionManager+ZPmanager.h"
#define iPhone6P  ScreenH == 736
#define iPhone6   ScreenH == 667
#define iPhone5   ScreenH == 568
#define iPhone4   ScreenH == 480
#define  parameter @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface ZPAdViewController ()
@property (weak, nonatomic) IBOutlet UIView *contionV;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageV;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property(nonatomic,weak)NSTimer *timer;
@property(strong, nonatomic) ZPAdItem *item;
@end

@implementation ZPAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置屏幕适配
    [self setLaunchImageView];
    //设置广告界面
    [self loadData];
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
    self.timer=timer;
    [timer fire];
    
}

- (void)runTime
{  static NSInteger sec=3;
    
    NSString *str=[NSString stringWithFormat:@"跳过(%ld)",sec];
    if(sec==-1)
    {
    
        
        [self adBtnClick];
    }
    [self.jumpBtn setTitle:str forState:UIControlStateNormal];
    sec--;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//加载数据
- (void)loadData
{
    //创建会话管理对象
    AFHTTPSessionManager *manager=[AFHTTPSessionManager ZP_Manager];
    
    
    NSMutableDictionary  *dict=[NSMutableDictionary dictionary];
    
    dict[@"code2"]=parameter;
    NSString  *url=@"http://mobads.baidu.com/cpro/ui/mads.php";
    
    [manager GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //把数据写入plist文件
        [responseObject writeToFile:@"/Users/admin/Desktop/data.plist "atomically:YES];
        NSArray *array=responseObject[@"ad"];
        if(array.count==0) return ;
        
        NSDictionary *diam=array.firstObject;
        
        ZPAdItem   *item=[ZPAdItem mj_objectWithKeyValues:diam];
        
        UIImageView *imageV=[[UIImageView alloc]init];
        
        CGFloat h=item.h*ScreenW/item.w;
        
        imageV.frame=CGRectMake(0, 0, ScreenW, h);
        
        imageV.userInteractionEnabled=YES;
        
        [imageV sd_setImageWithURL:[NSURL URLWithString:item.w_picurl]];
        [self.contionV  addSubview:imageV];
        self.item=item;
       // NSLog(@"%@",item.ori_curl);
        //创建点击手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openAdUrl)];
        
        [imageV addGestureRecognizer:tap];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
   
    
}

- (void)openAdUrl
{
    NSLog(@"%@",self.item.ori_curl);
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:self.item.ori_curl]])
    { [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.item.ori_curl]];
}
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
    
    [self.timer invalidate];
    self.timer=nil;
    
}


@end
