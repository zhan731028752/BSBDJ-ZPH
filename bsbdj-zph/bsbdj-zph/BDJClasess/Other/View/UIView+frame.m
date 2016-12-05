//
//  UIView+frame.m
//  02项目综合
//
//  Created by admin on 16/11/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)
-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;

}
-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;

}
-(CGFloat)y{
    return  self.frame.origin.y;
}
-(void)setWidth:(CGFloat)width{
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;

}
-(CGFloat)width{
    return self.frame.size.width;
    
}
-(void)setHight:(CGFloat)hight{
    CGRect frame=self.frame;
    frame.size.height=hight;
    self.frame=frame;
}
-(CGFloat)hight{
    return self.frame.size.height;
}
@end
