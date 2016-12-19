//
//  ZPCommentItem.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPCommentItem.h"

#import "ZPUserItem.h"
@implementation ZPCommentItem




-(NSString *)allcontent
{

    return  [NSString stringWithFormat:@"%@:%@",self.user.username,self.content];

}
@end
