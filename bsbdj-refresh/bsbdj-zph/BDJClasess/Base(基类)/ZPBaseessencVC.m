//
//  ZPBaseessencVC.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/18.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPBaseessencVC.h"
#import <AFNetworking.h>
#import "ZPTopItem.h"
#import <MJExtension.h>
#import "ZPAllTableViewCell.h"
#import "ZPEssenceItem.h"
#import "ZPFootrefreshView.h"
#import "ZPHeadloadView.h"

@interface ZPBaseessencVC ()

@property(nonatomic,strong)NSMutableArray *arrItem;

@property(nonatomic,strong)NSString *maxtime;

@property(nonatomic,weak)ZPFootrefreshView *footerView;

@property(nonatomic,weak)ZPHeadloadView   *headloadView;

@property(nonatomic,strong)AFHTTPSessionManager *manager;

@property(nonatomic,assign)UIEdgeInsets  or;


@end

@implementation ZPBaseessencVC


//创建请求管理对象
- (AFHTTPSessionManager *)manager
{
    if(_manager==nil)
    {
        _manager=[AFHTTPSessionManager ZP_Manager];
        
    }
    
    return _manager;
}


- (NSMutableArray *)arrItem
{
    if (_arrItem==nil) {
        _arrItem=[NSMutableArray array];
    }
    return _arrItem;
    
}

//只是为了消除警告,这个方法子类已经重写,永远不会执行的
-(TopicMidType)type
{

    return 0;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.estimatedRowHeight=300;
    [self.tableView registerClass:[ZPAllTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor=[UIColor grayColor];
    
    UIEdgeInsets  or=UIEdgeInsetsMake(99, 0,49, 0);
    
    self.tableView.scrollIndicatorInsets=or;
    self.or=or;
   
    
    
   
    [self setFooterView];
    [self setHeardView];
    [self.tableView.mj_header beginRefreshing];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
}
//下拉刷新
- (void)setHeardView
{
    
     MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    self.tableView.mj_header=header;
    //设置自动切换透明度
    header.automaticallyChangeAlpha=YES;
    
    //隐藏刷新时间
    //header.lastUpdatedTimeLabel.hidden=YES;
    //[self.tableView.mj_header beginRefreshing];

}

//上拉刷新
-(void)setFooterView
{
   MJRefreshAutoNormalFooter *footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [footer beginRefreshing];
    footer.automaticallyHidden=YES;
    self.tableView.mj_footer=footer;
    
}

#pragma mark - Table view data source





    


//加载更多数据
- (void)loadMoreData
{
    
    
    //发送请求的时候先取消以前的所有的请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
   
    //拼接参数
    NSString *url=@"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
  
    dict[@"a"]=@"list";
    dict[@"c"]=@"data";
    dict[@"type"]=@(self.type);
    dict[@"maxtime"]=_maxtime;
    
    //发送请求
    [self.manager zp_GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
         [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.maxtime=responseObject[@"info"][@"maxtime"];
        NSArray *arrData=responseObject[@"list"];
        
        NSMutableArray *arrItem=[ZPTopItem mj_objectArrayWithKeyValuesArray:arrData];
        
        
        for (ZPTopItem *item in arrItem) {
            ZPEssenceItem *essenceItem=[[ZPEssenceItem alloc]init];
            essenceItem.item=item;
            [self.arrItem addObject:essenceItem];
        }
        
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //停止刷新
         [self.tableView.mj_footer endRefreshing];
        
        
    }];
}






//加载数据
- (void)loadData
{
    
    //拼接参数
    NSString *url=@"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    
    NSString *a=@"list";
    if([self.parentViewController isKindOfClass:NSClassFromString(@"ZPNewViewController")]){
        a = @"newlist";
    }
    dict[@"a"]=a;
    dict[@"c"]=@"data";
    dict[@"type"]=@(self.type);
    //第一次加载不需要拼接这个参数
    // dict[@"maxtime"]=@"maxtime";
    
    
    //发送请求
    [self.manager zp_GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        self.maxtime=responseObject[@"info"][@"maxtime"];
        
        NSArray *arrData=responseObject[@"list"];
        
        NSMutableArray *arrItem=[ZPTopItem mj_objectArrayWithKeyValuesArray:arrData];
        
        [self.arrItem removeAllObjects];
        for (ZPTopItem *item in arrItem) {
            ZPEssenceItem *essenceItem=[[ZPEssenceItem alloc]init];
            essenceItem.item=item;
            [self.arrItem addObject:essenceItem];
        }
        //把tableView的内边距复位
        self.tableView.contentInset=self.or;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
        
        [self.tableView.mj_header endRefreshing];
    }];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    self.tableView.mj_footer.automaticallyHidden=(self.arrItem.count==0);
    
    
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
    
    return  item.cellH+10;
    
}

@end
