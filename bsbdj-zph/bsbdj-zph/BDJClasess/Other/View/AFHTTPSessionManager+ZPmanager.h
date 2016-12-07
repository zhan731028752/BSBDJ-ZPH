//
//  AFHTTPSessionManager+ZPmanager.h
//  bsbdj-zph
//
//  Created by admin on 16/12/6.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (ZPmanager)

/**
 返回一个可以接受@"text/html"类型的会话管理者
 */
+ (instancetype)ZP_Manager;

- (NSURLSessionDataTask *)ZP_GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;



@end
