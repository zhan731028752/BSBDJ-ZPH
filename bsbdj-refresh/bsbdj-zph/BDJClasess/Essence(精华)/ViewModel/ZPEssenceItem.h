//
//  ZPEssenceItem.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/13.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZPTopItem;

@interface ZPEssenceItem : NSObject

@property(nonatomic,strong)ZPTopItem  *item;

@property(nonatomic,assign)CGFloat cellH;


@property(nonatomic,assign)CGRect  cdn_imgF;

@property(nonatomic,assign)CGRect  nameF;

@property(nonatomic,assign)CGRect  textF;

@property(nonatomic,assign)CGRect  passtimeF;

@property(nonatomic,assign)CGRect  weixin_urlF;

@property(nonatomic,assign)CGRect  profile_imageF;

@property(nonatomic,assign)CGRect  btnF;

@property(nonatomic,assign)CGRect topViewF;

@property(nonatomic,assign)CGRect midViewF;

@property(nonatomic,assign)CGRect midVideoF;

@property(nonatomic,assign)CGRect contentViewF;

@property(nonatomic,assign)CGRect bottomViewF;
//width
//is_gif
//image0
//image1
//image2
//height
@end
