//
//  ZPPhotoManager.h
//  bsbdj-zph
//
//  Created by Apple on 2016/12/17.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PHAssetCollection;
@interface ZPPhotoManager : NSObject


/**
存图片到相册

@param image 存的图片
@param title 相册标题
@param completionHandler 存储完成,操作
*/
+(void)savePhoto:(UIImage*)image toCollectin:(NSString*)title completionHandler:( void(^)(BOOL success, NSError * error))completionHandler;


/**
 查询相册,根据相册名字
 
 @param title 相册名
 @return 查询到相册
 */
+(PHAssetCollection*)searchCollection:(NSString*)title;



@end
