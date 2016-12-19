//
//  AllcontrollerVC.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/11.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "AllcontrollerVC.h"
#import <AFNetworking.h>
#import "ZPTopItem.h"
#import <MJExtension.h>
#import "ZPAllTableViewCell.h"
#import "ZPEssenceItem.h"
@interface AllcontrollerVC ()

@property(nonatomic,strong)NSMutableArray *arrItem;
@end

@implementation AllcontrollerVC

- (NSMutableArray *)arrItem
{
    if (_arrItem==nil) {
        _arrItem=[NSMutableArray array];
    }
    return _arrItem;

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadData];
    self.tableView.estimatedRowHeight=300;
     [self.tableView registerClass:[ZPAllTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source





//加载数据
- (void)loadData
{
    
    //创建请求管理对象
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager ZP_Manager];
    
    //拼接参数
    NSString *url=@"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"a"]=@"list";
    dict[@"c"]=@"data";
   // dict[@"maxtime"]=@"maxtime";
    
    //发送请求
    [manager zp_GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        NSArray *arrData=responseObject[@"list"];
        
        NSMutableArray *arrItem=[ZPTopItem mj_objectArrayWithKeyValuesArray:arrData];
        
        

        for (ZPTopItem *item in arrItem) {
            ZPEssenceItem *essenceItem=[[ZPEssenceItem alloc]init];
            essenceItem.item=item;
            [self.arrItem addObject:essenceItem];
        }
      
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrItem.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZPAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ] ;
    cell.essenceItem=self.arrItem[indexPath.row];
//    cell.backgroundColor=[UIColor redColor];
  
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPEssenceItem *item=self.arrItem[indexPath.row];
    
   return  item.cellH;

}

@end
