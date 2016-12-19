//
//  ZPEssenceItem.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPEssenceItem.h"
#import "ZPTopItem.h"
#import "ZPCommentItem.h"
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
        CGFloat  passtimeY=CGRectGetMaxY(self.nameF)-5;
        CGFloat  passtimeW=nameW ;
        CGFloat  passtimeH= 25;
        self.passtimeF=CGRectMake(passtimeX, passtimeY, passtimeW, passtimeH);
        
        CGFloat btnW=60;
        CGFloat btnX=ScreenW-btnW;
        CGFloat btnH=20;
        CGFloat btnY=profileY;
        self.btnF=CGRectMake(btnX, btnY, btnW, btnH);
        
      
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        dict[NSFontAttributeName]=[UIFont systemFontOfSize:14];
        CGRect  rect=[item.text boundingRectWithSize:CGSizeMake(ScreenW-2*space, HUGE)options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        CGFloat  textX=0;
        CGFloat  textY=CGRectGetMaxY(self.profile_imageF)+space;
        CGFloat  textW= ScreenW-2*space;
        CGFloat  textH=rect.size.height;
        self.textF=CGRectMake(textX, 50, textW, textH);
        
       
        self.topViewF=CGRectMake(0, 0, textW, textH+space);
        _cellH=CGRectGetMaxY(self.textF)+space;
        
        if (item.type!=TopicMidTypeText) {
            
            CGFloat midViewW=textW;
            
            CGFloat midViewH=midViewW/item.width*item.height;
            if (midViewH>ScreenH&&!item.is_gif) {
                midViewH=300;
                item.isbigPic=YES;
            }
            self.midViewF=CGRectMake(space, _cellH, midViewW, midViewH);
             _cellH=CGRectGetMaxY(self.midViewF)+space;
        }
       
        if(item.commentItem)
        {
            //NSLog(@"%@",item.commentItem.uesrItem.username);
            CGFloat  commentX=space;
            CGFloat  commentY=_cellH;
            CGFloat  commentW=ScreenW-2*space;
            CGFloat  commentH=42;
            if(item.commentItem.cmt_type==TopicMidTypeText)
            {
                NSMutableDictionary  *dict=[NSMutableDictionary dictionary];
                dict[NSFontAttributeName]=[UIFont systemFontOfSize:14];
                commentH= [item.commentItem.allcontent boundingRectWithSize:CGSizeMake(commentW, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height+20;
                
                
                
            }
            self.contentViewF=CGRectMake(commentX, commentY, commentW, commentH);
            _cellH=CGRectGetMaxY(self.contentViewF)+space;
        }
        
        CGFloat   bottomViewX=space;
        CGFloat   bottomViewW=ScreenW-2*space;
        CGFloat   bottomViewY=_cellH;
        CGFloat   bottomViewH=42;
        self.bottomViewF=CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);
        _cellH+=42;
    }
    
    
}

@end
