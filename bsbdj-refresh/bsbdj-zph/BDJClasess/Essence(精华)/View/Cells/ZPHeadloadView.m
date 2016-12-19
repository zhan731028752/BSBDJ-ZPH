//
//  ZPHeadloadView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/17.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPHeadloadView.h"
@interface ZPHeadloadView()
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;

@end
@interface ZPHeadloadView ()

@property (weak, nonatomic) IBOutlet UIView *pullV;
@property (weak, nonatomic) IBOutlet UILabel *pullLal;
@property (weak, nonatomic) IBOutlet UIImageView *pullImage;

@end
@implementation ZPHeadloadView

+(instancetype)headloadView

{
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    
}

-(void)setIsAllShow:(BOOL)isAllShow
{
    
    _isAllShow=isAllShow;
    self.pullLal.text=isAllShow?@"松手就可以加载更多数据":@"下拉就可以加载更多数据";
    
    [UIView animateWithDuration:0.5 animations:^{
         self.pullImage.transform=isAllShow?CGAffineTransformMakeRotation(-M_PI+0.00001):CGAffineTransformIdentity;
    }];
   
    
    

}

-(void)setIsbeingLoad:(BOOL)isbeingLoad
{
    _isbeingLoad=isbeingLoad;
    
    self.pullV.hidden=isbeingLoad;
    
    
    
    
}


@end
