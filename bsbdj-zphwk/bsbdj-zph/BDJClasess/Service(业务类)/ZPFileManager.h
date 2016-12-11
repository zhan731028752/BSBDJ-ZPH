//
//  ZPFileManager.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/11.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPFileManager : NSObject

/**
 给一个指定的文件夹路经，清除该文件夹的缓存
 */
+(void)clearFileWithpath:(NSString *)path;


/**
 给一个指定的文件夹路经，得到该文件夹里面文件的大小
 */
+(void)getFileSize:(NSString *)path complete:(void(^)(NSString *cleanNum))complete;

@end
