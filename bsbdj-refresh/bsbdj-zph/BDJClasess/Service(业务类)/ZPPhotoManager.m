//
//  ZPPhotoManager.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/17.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPPhotoManager.h"
#import <Photos/Photos.h>
@implementation ZPPhotoManager
+(void)savePhoto:(UIImage*)image toCollectin:(NSString*)title completionHandler:( void(^)(BOOL success, NSError * error))completionHandler

{
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
        
        //创建一个请求,把一个图片存储到相册
        //1把图片存到系统相册
        //2在存图片前,现在相册中给他创建一个占位对象,存储完成之后,占位对象引用到真实的图片
        PHAssetChangeRequest  *createAssetRequest=[PHAssetChangeRequest creationRequestForAssetFromImage:image];
        //创建一个字定义相册,并且生成一个相册请求对象
        PHAssetCollection  *collection=[self searchCollection:title];
        
        PHAssetCollectionChangeRequest  *albumChangeRequest;
        if (collection) {
            albumChangeRequest=[PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        }else{
        
            albumChangeRequest=[PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
        }
        //通过一个相片请求对象,获得存储的图片的占位对象
        PHObjectPlaceholder *assetPlaceholder=[createAssetRequest placeholderForCreatedAsset];
        //把占位对象作为参数,实现引用存储图片到相册
        
        [albumChangeRequest addAssets:@[assetPlaceholder]];
        
    } completionHandler:completionHandler
     
     
     ];
    
}

+(PHAssetCollection*)searchCollection:(NSString*)title
{
    PHFetchResult *result=[PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum  subtype:PHAssetCollectionSubtypeAlbumRegular  options:nil];
    
    for (PHAssetCollection *collection in result) {
        if([collection.localizedTitle isEqualToString:title]){
        
            return collection;
        }
    }
    
    return nil;
}



@end
