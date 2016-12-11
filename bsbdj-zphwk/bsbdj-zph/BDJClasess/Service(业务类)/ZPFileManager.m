//
//  ZPFileManager.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/11.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPFileManager.h"

@implementation ZPFileManager



+(void)clearFileWithpath:(NSString *)path
{
    
    NSFileManager *manager=[NSFileManager defaultManager];
    
    BOOL isDirectory;
    [manager fileExistsAtPath:path isDirectory:&isDirectory];
    //判断是否是合法的路径
    if (!isDirectory)
    {
        [[[NSException alloc]initWithName:@"小傻，不是正常的文件路径，清除毛线啊！！！" reason:@"路径不合法"userInfo:nil] raise];
        
    }

    NSArray *arrName=[manager subpathsAtPath:path];
    
    for (NSString *name in arrName) {
        NSString *fillPath=[path stringByAppendingPathComponent:name];
        
        //忽略掉隐藏的文件
        if ([fillPath containsString:@".DS"])  continue;
        
        //忽略系统自带的文件夹，不让会报错
        if ([fillPath containsString:@"Snapshots"]) continue;
        
        BOOL isDirectory;
        BOOL  isExistFile=[manager fileExistsAtPath:fillPath isDirectory:&isDirectory];
        //忽略文件夹
        if (!isExistFile||isDirectory) continue;
        
        [manager removeItemAtPath:fillPath error:nil];
        
    }
    
}


+(void)getFileSize:(NSString *)path complete:(void(^)(NSString *cleanNum))complete

{
    
    NSFileManager *manager=[NSFileManager defaultManager];
    BOOL isDirectory;
    [manager fileExistsAtPath:path isDirectory:&isDirectory];
    //判断是否是合法的路径
    if (!isDirectory)
    {
        [[[NSException alloc]initWithName:@"小傻，不是正常的文件路径，计算毛线！！！" reason:@"路径不合法"userInfo:nil] raise];
        
         //jave的写法
        //@throw  [NSException exceptionWithName:@"路径error" reason:@"小傻瓜,路径都错了,计算毛线啊!!!" userInfo:nil];
        
    }
    
    
    
      //计算文件的大小比较耗性能开启子线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //获取文件夹下的所有文件的名字
        NSArray *arrName=[manager subpathsAtPath:path];
        NSUInteger size=0;
        for (NSString *name in arrName) {
            
            NSString *fileName= [path stringByAppendingPathComponent:name];
            
            //忽略掉隐藏的文件
            if ([fileName containsString:@".DS"])  continue;
            
            //忽略系统自带的文件夹，不然在真机会报错
            if ([fileName containsString:@"Snapshots"]) continue;
            
            BOOL isDirectory;
            BOOL  isExistFile=[manager fileExistsAtPath:fileName isDirectory:&isDirectory];
            //忽略文件夹
            if (!isExistFile||isDirectory) continue;
            
            
            NSDictionary *dict= [manager attributesOfItemAtPath:fileName error:nil];
            
            NSUInteger s= [dict fileSize];
            size+=s;
           
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *count=@"";
            if(size>=1000*1000)
            {
                count=[NSString stringWithFormat:@"清除缓存%.1fMB",size/1000.0/1000.0];
                
            }
            else if(size>=1000)
            {
                count=[NSString stringWithFormat:@"清除缓存%.1fKB",size/1000.0];
                
            }
            else if(size>0)
            {
                
                count=[NSString stringWithFormat:@"清除缓存%.1fB",size*0.1];
            }else{
                
                count=@"清除缓存";
            }
            
            count=[count stringByReplacingOccurrencesOfString:@".0" withString:@""];
            complete(count);
        });
        
    });
    
    
    
}
@end
