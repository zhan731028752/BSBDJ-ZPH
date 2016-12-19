//
//  ZPSettingTableVc.m
//  bsbdj-zph
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPSettingTableVc.h"
#import "ZPBackView.h"
#import <SDImageCache.h>
#import "ZPFileManager.h"
#import <SVProgressHUD.h>
#define filePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject
@interface ZPSettingTableVc ()

@end
static NSString * const  ID=@"cell";
@implementation ZPSettingTableVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //[[SDImageCache sharedImageCache]getSize]
    [SVProgressHUD showWithStatus:@"正在计算缓存，请稍等"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [SVProgressHUD dismiss];


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
 // __block  NSString   *size;
    
    [ZPFileManager getFileSize:filePath complete:^(NSString *cleanNum) {
        
        //size=cleanNum;
       
        cell.textLabel.text=cleanNum;
    }];
    [SVProgressHUD dismiss];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    [ZPFileManager clearFileWithpath:filePath];
    
        [self.tableView reloadData];
  
    
    
}


@end
