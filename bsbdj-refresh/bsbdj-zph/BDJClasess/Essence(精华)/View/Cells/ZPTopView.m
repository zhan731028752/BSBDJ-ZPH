//
//  ZPTopView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTopView.h"
#import "ZPTopItem.h"
#import "ZPEssenceItem.h"
#import <UIImageView+WebCache.h>
#import "NSDate+ZPDate.h"

@interface ZPTopView ()

@property(nonatomic,weak)UIImageView *cdn_imgImageV;

@property(nonatomic,weak)UILabel *nameLabel;

@property(nonatomic,weak)UILabel *textLabe;

@property(nonatomic,weak)UILabel *passtimeL;

@property(nonatomic,weak)UIImageView *weixin_urlImageV;

@property(nonatomic,weak)UIImageView *profile_imageView;

@property(nonatomic,weak)UIButton *btn;
@end
@implementation ZPTopView



+(instancetype)topView
{
    ZPTopView  *tv=[[ZPTopView alloc]init];
    
    [tv topViewaddChildControls];
    
    return tv;
}

- (void)topViewaddChildControls
{
    
    self.autoresizingMask=UIViewAutoresizingNone  ;
    //创建昵称
    UILabel  *nameLabel=[[UILabel alloc]init];
    self.nameLabel=nameLabel;
    [self addSubview:nameLabel];
    
    
    //创建图标
    UIImageView *picimageView=[[UIImageView alloc]init];
    self.profile_imageView=picimageView;
    [self addSubview:picimageView];
    
    
    //创建时间
    UILabel  *passtimeL=[[UILabel alloc]init];
    self.passtimeL=passtimeL;
    passtimeL.font=[UIFont systemFontOfSize:14];
    [self addSubview:passtimeL];
    
    
    //创建标题
    UILabel  *textLabel=[[UILabel alloc]init];
    textLabel.numberOfLines=0;
    self.textLabe=textLabel;
    textLabel.font=[UIFont systemFontOfSize:14];
    [self addSubview:textLabel];
    
    //创建按钮
    UIButton *btn=[[UIButton alloc]init];
    self.btn=btn;
    [btn setImage:[UIImage imageNamed:@"cellmorebtnnormal"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"cellmorebtnclick"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    
}


- (void)btnClick
{
    UIAlertController *alerv=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction  *act1=[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction  *act2=[UIAlertAction actionWithTitle:@"转发" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction  *act3=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                handler:nil];
    
    [alerv addAction:act1];
    [alerv addAction:act2];
    [alerv addAction:act3];
    [self.window.rootViewController  presentViewController:alerv animated:YES completion:nil];
    
}


//设置数据
-(void)setEssenceItem:(ZPEssenceItem *)essenceItem
{
    _essenceItem=essenceItem;
    
    self.nameLabel.text=essenceItem.item.name;
    self.passtimeL.text=[self setUpcreateTime];
    self.textLabe.text=essenceItem.item.text;
    
    [self.profile_imageView sd_setImageWithURL:[NSURL URLWithString:essenceItem.item.profile_image]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        
        UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width , image.size.height)];
        
        [path addClip];
        
        [image drawAtPoint:CGPointZero];
        
        UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        self.profile_imageView.image=newImage;
        
    }];
    
    
    
    
}


- (NSString *)setUpcreateTime
{
    //@"2016-08-24 19:12:20"; //
    
    NSString *time=self.essenceItem.item.create_time;
    
    NSDateFormatter  *datefor=[[NSDateFormatter alloc]init];
    
    datefor.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date=[datefor dateFromString:time];
    
    if([date isThisYear]){
        if([date isToday]){
            NSDateComponents  *component=[date dealTime];
            if(!component.hour){
                if(component.minute<1){
                    time=@"刚刚";
                    
                }else {
                    
                    time=[NSString stringWithFormat:@"%zd分钟前",component.minute];
                    
                    
                }
                
            }else{
                
                time=[NSString stringWithFormat:@"%zd小时前",component.hour];
                
            }
            
        }else if([date isToyesterday])
        {
            datefor.dateFormat=@"昨天 HH:mm:ss";
            
            time=[datefor stringFromDate:date];
        }
        
    }else{
        datefor.dateFormat=@"yyyy:MM:dd HH:mm:ss";
        time=[datefor stringFromDate:date];
    }
    
    
    return time;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cdn_imgImageV.frame=self.essenceItem.cdn_imgF;
    
    self.profile_imageView.frame=self.essenceItem.profile_imageF;
    
    self.nameLabel.frame=self.essenceItem.nameF;
    
    self.btn.frame=self.essenceItem.btnF;
    
    self.textLabe.frame=self.essenceItem.textF;
    
    self.passtimeL.frame=self.essenceItem.passtimeF;
    
    //    self.profile_imageView.layer.cornerRadius=self.size.width;
    //    [self.profile_imageView.layer masksToBounds];
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
