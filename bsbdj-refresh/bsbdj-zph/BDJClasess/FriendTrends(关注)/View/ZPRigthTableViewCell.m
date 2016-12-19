//
//  ZPRigthTableViewCell.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/19.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPRigthTableViewCell.h"

#import "ZPRigthItem.h"
#import <UIImageView+WebCache.h>
@interface ZPRigthTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *tieleL;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end
@implementation ZPRigthTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


-(void)setRigthItem:(ZPRigthItem *)rigthItem
{
    
    _rigthItem=rigthItem;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:rigthItem.header] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
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
    
    NSString *str=[NSString stringWithFormat:@"%zd万订阅",rigthItem.gender];
    
    //可以把带掺杂有中文的字符中的数字转换为num
    NSInteger num=str.integerValue;
    
    if(num>10000){
        
        str=[NSString stringWithFormat:@"%.1f万订阅",num/10000.0];
        
    }
    
    //替换字符串
    str=[str stringByReplacingOccurrencesOfString:@".0" withString:@""];
    self.desLabel.text=str;
    
    self.tieleL.text=rigthItem.screen_name;

    

    
}

-(void)setFrame:(CGRect)frame

{
    
    frame.size.height-=1;
    
    //frame.origin.y+=1;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
