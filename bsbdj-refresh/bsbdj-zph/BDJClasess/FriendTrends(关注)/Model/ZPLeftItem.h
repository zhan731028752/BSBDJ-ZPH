//
//  ZPLeftItem.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/19.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPLeftItem : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *id;

@property(nonatomic,assign)NSInteger page;


@property(nonatomic,strong)NSMutableArray *arrM;

@property(nonatomic,strong)NSString *total_page;
@end
