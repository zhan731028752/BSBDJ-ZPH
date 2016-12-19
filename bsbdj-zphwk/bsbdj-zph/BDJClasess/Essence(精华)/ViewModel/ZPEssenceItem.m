//
//  ZPEssenceItem.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPEssenceItem.h"
#import "ZPTopItem.h"

@implementation ZPEssenceItem

-(void)setItem:(ZPTopItem *)item

{
    _item=item;
    if (_cellH==0) {
        
        
        CGFloat  space=10;
        CGFloat  profileX=space;
        CGFloat  profileY=space;
        CGFloat  profileW=40;
        CGFloat  profileH=40;
        self.profile_imageF=CGRectMake(profileX, profileY, profileW, profileH);
        
        CGFloat  nameX=CGRectGetMaxX(self.profile_imageF)+space;
        CGFloat  nameY=profileY;
        CGFloat  nameW=ScreenW-nameX;
        CGFloat  nameH=25;
        self.nameF=CGRectMake(nameX, nameY,nameW, nameH);
        
        CGFloat  passtimeX=nameX;
        CGFloat  passtimeY=CGRectGetMaxY(self.nameF);
        CGFloat  passtimeW=nameW ;
        CGFloat  passtimeH= 25;
        self.passtimeF=CGRectMake(passtimeX, passtimeY, passtimeW, passtimeH);
        
        
        
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        dict[NSFontAttributeName]=[UIFont systemFontOfSize:13];
        CGRect  rect=[self.item.text boundingRectWithSize:CGSizeMake(ScreenW-2*space, HUGE)options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        CGFloat  textX=0;
        CGFloat  textY=CGRectGetMaxY(self.profile_imageF)+space;
        CGFloat  textW= ScreenW-2*space;
        CGFloat  textH=rect.size.height;
        self.textF=CGRectMake(textX, textY, textW, textH);
        
        self.topViewF=CGRectMake(0, 0, ScreenW, textH+space);
        _cellH=CGRectGetMaxY(self.textF)+space;
        
        if (item.type!=TopicMidTypeText) {
            
            CGFloat midViewW=textW;
            
            CGFloat midViewH=midViewW/item.width*item.height;
            if (midViewH>ScreenH&&!item.is_gif) {
                midViewH=300;
                item.isbigPic=YES;
            }
             self.midViewF=CGRectMake(space, _cellH, midViewW, midViewH);
        }
       
        
        _cellH=CGRectGetMaxY(self.midViewF)+space;
    }
    

}

@end
