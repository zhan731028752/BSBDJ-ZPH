//
//  ZPTagboardVc.m
//  bsbdj-zph
//
//  Created by admin on 16/12/7.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTagboardVc.h"
#import "ZPTagViewCell.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "ZPTagItem.h"
#import <SVProgressHUD.h>
@interface ZPTagboardVc ()

@property(nonatomic,strong )NSMutableArray *Arritem;

@property(nonatomic,strong) AFHTTPSessionManager *manager;

@end
@implementation ZPTagboardVc



-(void)viewDidLoad
{
   
   [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor grayColor];
    
    //在第一个cell的上面加上一个条
   self.tableView.contentInset=UIEdgeInsetsMake(1, 0, 0, 0);
    
    //隐藏系统自带的分割线
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZPTagViewCell class]) bundle:nil] forCellReuseIdentifier:@"ce"];
    
self.navigationItem.title=@"新帖关注";
    
    [self loadData];
}
//控制器View消失的时候执行该方法
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
  
    //在这个会话对象的管理下的任务,全部结束请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
     [SVProgressHUD dismiss];

       }

- (void)loadData

{
    //创建会话管理对象
    AFHTTPSessionManager *manager=[AFHTTPSessionManager ZP_Manager];
    
    self.manager=manager;
    
    //设置参数
    NSString *url=@"http://api.budejie.com/api/api_open.php";
    
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    dictM[@"a"]=@"tags_list";
    dictM[@"c"]=@"subscribe";
    
      [SVProgressHUD showWithStatus:@"客观别急,马上过来"];
   //发送请求
  
    [manager GET:url parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
      
        [responseObject writeToFile:@"/Users/admin/Desktop/data.plist" atomically:YES];
        NSArray *array=responseObject[@"rec_tags"];
        
     NSMutableArray  *arrItem=[ZPTagItem mj_objectArrayWithKeyValuesArray:array];
        
        self.Arritem=arrItem;
        
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
       //NSLog(@"%zd",arrItem.count);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD dismiss];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    return self.Arritem.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPTagViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:@"ce"];
    
    cell.item=self.Arritem[indexPath.row];
    
    return cell;

}

//返回cell的高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 80+1;

}
@end
