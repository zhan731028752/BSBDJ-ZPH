//
//  ZPTagViewCell.m
//  bsbdj-zph
//
//  Created by admin on 16/12/7.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTagViewCell.h"
#import "ZPTagItem.h"
#import <UIImageView+WebCache.h>
@interface ZPTagViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *tieleL;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

@implementation ZPTagViewCell


-(void)setItem:(ZPTagItem *)item
{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:item.image_list] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if(image==nil) return ;
        
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        
        //确定裁剪区域
        UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width,image.size.height)];
        //添加裁剪
        
        [path addClip];
        
        //把图片画的图形上下文中
        [image drawAtPoint:CGPointZero];
        
        //生成一张图片
        UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭上下文
        UIGraphicsEndImageContext();
        
        self.imageV.image=newImage;
        
    }];
    
    //item.image_list;
   // int a= item.sub_number.intValue;
    
    NSString *str=[NSString stringWithFormat:@"%@万订阅",item.sub_number];
    
    //可以把带掺杂有中文的字符中的数字转换为num
    NSInteger num=str.integerValue;
    
    if(num>10000){
        
    str=[NSString stringWithFormat:@"%.1f万订阅",num/10000.0];
        
    }
    
    //替换字符串
    str=[str stringByReplacingOccurrencesOfString:@".0" withString:@""];
    self.desLabel.text=str;
    
    self.tieleL.text=item.theme_name;

    

}

-(void)setFrame:(CGRect)frame

{

    frame.size.height-=1;
    
    //frame.origin.y+=1;
    [super setFrame:frame];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //通过使用layer来做裁剪
//    这样性能不好
//    self.imageV.layer.cornerRadius=30;
//    self.imageV.layer.masksToBounds=YES;
    
}

@end
