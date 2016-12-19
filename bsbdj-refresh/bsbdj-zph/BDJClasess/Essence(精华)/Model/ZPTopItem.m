//
//  ZPAllItem.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/12.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTopItem.h"
#import <MJExtension.h>
#import "ZPCommentItem.h"
@implementation ZPTopItem

-(void)setTop_cmt:(NSArray *)top_cmt
{
 if(top_cmt.count)
 {
 
     self.commentItem=top_cmt.firstObject;
 
 }

    _top_cmt=top_cmt;
}

+(NSDictionary *)mj_objectClassInArray
{

    return @{@"top_cmt":@"ZPCommentItem"};

}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
