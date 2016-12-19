//
//  ZPFootrefreshView.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/17.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPFootrefreshView.h"
@interface  ZPFootrefreshView()
@property (weak, nonatomic) IBOutlet UILabel *pulllal;
@property (weak, nonatomic) IBOutlet UIView *loadV;

@end
@implementation ZPFootrefreshView

+(instancetype)footrefreshView

{

    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;

}

-(void)setIsbeingLoad:(BOOL)isbeingLoad
{
    _isbeingLoad=isbeingLoad;
   
    
    self.pulllal.hidden=isbeingLoad;
    self.loadV.hidden=!isbeingLoad;

}
@end
