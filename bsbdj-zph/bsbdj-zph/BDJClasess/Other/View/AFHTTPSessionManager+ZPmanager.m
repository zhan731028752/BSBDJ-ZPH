//
//  AFHTTPSessionManager+ZPmanager.m
//  bsbdj-zph
//
//  Created by admin on 16/12/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "AFHTTPSessionManager+ZPmanager.h"

@implementation AFHTTPSessionManager (ZPmanager)

+ (instancetype)ZP_Manager
{
    //创建会话管理对象
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    return manager;

}




- (NSURLSessionDataTask *)ZP_GET:(NSString *)URLString
                      parameters:(id)parameters
                        progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                         success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;
{



    return [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}

@end
