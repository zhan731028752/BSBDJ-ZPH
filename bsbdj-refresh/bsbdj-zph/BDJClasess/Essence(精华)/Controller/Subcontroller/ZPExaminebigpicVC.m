//
//  ZPExaminebigpicVC.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/17.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPExaminebigpicVC.h"
#import "ZPTopItem.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import <SVProgressHUD.h>
#import <Photos/Photos.h>
#import "ZPPhotoManager.h"
@interface ZPExaminebigpicVC ()<UIScrollViewDelegate>

@property(nonatomic,weak)UIImageView *imageV;

@property(nonatomic,weak)UIScrollView  *scorllV;

@property(nonatomic,weak)UIButton *saveBtn;

@property(nonatomic,weak)UIImage *image;
@end

@implementation ZPExaminebigpicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self viewAddChildControls];
}

- (void)viewAddChildControls
{
    
    UIScrollView  *scorllV=[[UIScrollView alloc]init];
    [self.view addSubview:scorllV];
    scorllV.delegate=self;
    scorllV.backgroundColor=[UIColor clearColor];
    scorllV.frame=[UIScreen mainScreen].bounds;
    self.scorllV=scorllV;
    
    UIImageView  *imageV=[[UIImageView alloc]init];
    [scorllV addSubview:imageV];
    self.imageV = imageV;
    
    UIButton *backBtn=[[UIButton alloc]init];
    [self.view addSubview:backBtn];
    backBtn.frame=CGRectMake(10, 20, 50, 50);
    [backBtn setImage:[UIImage imageNamed:@"show_image_back_icon"] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //点击返回按钮执行
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
  
    
    //添加保存按钮
    UIButton *saveBtn=[[UIButton alloc]init];
    [self.view addSubview:saveBtn];
    saveBtn.backgroundColor=[UIColor grayColor];
    saveBtn.frame=CGRectMake(ScreenW-80, ScreenH-40, 60, 20);
    [saveBtn setTitle:@"保存" forState: UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    saveBtn.enabled=NO;
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.saveBtn=saveBtn;
    
    //先取出硬盘中存储的图片
    UIImage *image1=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:
                    self.topItem.image0];
    if (image1) {
        
        saveBtn.enabled=YES;
    }
    
    CGFloat imageH=ScreenW/self.topItem.width*_topItem.height;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString: self.topItem.image0] placeholderImage:image1 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image=image;
        if (image) {
            saveBtn.enabled=YES;
        }
    }];
    
    imageV.frame=CGRectMake(0, 0, ScreenW, imageH);
    
    if(imageH>ScreenH)
    {
        scorllV.contentSize=CGSizeMake(0, imageH);
        scorllV.minimumZoomScale=1.0;
        scorllV.maximumZoomScale=2.0;
        
    }else{
        
        
        imageV.center=CGPointMake(ScreenW*0.5, ScreenH*0.5);
        
    }
    
    
}


//保存图片的按钮点击
-(void)saveBtnClick{
    
    
    //判断用户权限
    
    /* PHAuthorizationStatusNotDetermined = 0,    未决定  PHAuthorizationStatusRestricted,          家长控制状态       PHAuthorizationStatusDenied,        //拒绝
     PHAuthorizationStatusAuthorized     // 允许授权*/
    PHAuthorizationStatus  staus=[PHPhotoLibrary authorizationStatus];
    if(staus==PHAuthorizationStatusAuthorized)
    {
    [ZPPhotoManager savePhoto:self.image toCollectin:@"百思不得姐" completionHandler:^(BOOL success, NSError *error) {
        
        if(success){
            [SVProgressHUD showSuccessWithStatus:@"保存成功"];
        
        }else{
            [SVProgressHUD  showErrorWithStatus:@"保存失败"];
        }
    }];
    
    }else{
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]])
       {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
        }
    
    }
    
//    UIImageWriteToSavedPhotosAlbum(self.image, self , @selector(image:didFinishSavingWithError:contextInfo:), nil);
}



//- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//{
//    if(!error)
//    {
//        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
//    }else
//    {
//   
//     [SVProgressHUD showErrorWithStatus:@"保存失败"];
//    }
//
//}

- (void)backBtnClick
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return self.imageV;
    
}
@end
