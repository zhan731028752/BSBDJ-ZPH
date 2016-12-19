//
//  ZPTreandAttentionVC.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/19.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPTreandAttentionVC.h"
#import "ZPLeftTableViewCell.h"
#import <AFNetworking.h>
#import "ZPLeftItem.h"
#import <MJExtension.h>
#import "ZPRigthItem.h"
#import "ZPRigthTableViewCell.h"
#import <MJRefresh.h>
@interface ZPTreandAttentionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTableV;
@property (weak, nonatomic) IBOutlet UITableView *rigthTableV;
@property(strong,nonatomic)NSMutableArray  *arrleftItem;
@property(strong,nonatomic)NSMutableArray  *arrRightItem;
@property(strong,nonatomic)ZPLeftItem *leftItem;
@property(strong,nonatomic) AFHTTPSessionManager  *manager;
@end
static NSString *leftID=@"leftcell";
static NSString *rightID=@"rightcell";
@implementation ZPTreandAttentionVC

-(AFHTTPSessionManager *)manager
{
    
    if(_manager==0){
        
        _manager=[AFHTTPSessionManager ZP_Manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.leftTableV registerNib:[UINib nibWithNibName:@"ZPLeftTableViewCell" bundle:nil] forCellReuseIdentifier:leftID];
    [self.rigthTableV registerNib:[UINib nibWithNibName:@"ZPRigthTableViewCell" bundle:nil] forCellReuseIdentifier:rightID];
    
    self.rigthTableV.contentInset=UIEdgeInsetsMake(64,0, 0, 0);
    self.leftTableV.delegate=self;
    
    self.leftTableV.dataSource=self;
    
    self.rigthTableV.delegate=self;
    
    self.rigthTableV.dataSource=self;
    
    [self loadleftData];
    
    //下拉
    [self setHeardRefresh];
    
    
    //上拉
    [self setfootRefresh];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


//设置下拉拉刷新
-(void)setHeardRefresh
{
    
    MJRefreshNormalHeader  *heard=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadrightData)];
    [heard beginRefreshing];
    heard.automaticallyChangeAlpha=YES;
    self.rigthTableV.mj_header=heard;
    
    
}

//设置上拉刷新
-(void)setfootRefresh
{
    
    MJRefreshAutoNormalFooter  *footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadrightMoreData)];
    footer.automaticallyHidden=YES;
    self.rigthTableV.mj_footer=footer;
}



- (void)loadrightData
{
    
    //创建请求管理对象
    
    //拼接参数
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    
    dict[@"a"]=@"list";
    dict[@"c"]=@"subscribe";
    dict[@"category_id"]=self.leftItem.id;
    
    self.leftItem.page=1;
    //发送请求
    [self.manager zp_GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        [self.rigthTableV.mj_header  endRefreshing];
        self.leftItem.page++;
        NSArray *array=responseObject[@"list"];
        self.leftItem.arrM= [ZPRigthItem mj_objectArrayWithKeyValuesArray:array];
        
        
        
        [self.rigthTableV reloadData];
        
        self.rigthTableV.mj_footer.hidden=self.leftItem.page>[self.leftItem.total_page integerValue] ;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        [self.rigthTableV.mj_header  endRefreshing];
    }];
    
    
    
    
    
    
}


- (void)loadrightMoreData
{
    
    
    //拼接参数
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    
    dict[@"a"]=@"list";
    dict[@"c"]=@"subscribe";
    dict[@"category_id"]=self.leftItem.id;
    dict[@"page"] = @(self.leftItem.page);
    //发送请求
    [self.manager zp_GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask*task, NSDictionary *responseObject) {
        [self.rigthTableV.mj_footer endRefreshing ];
        self.leftItem.page++;
        NSArray *array=responseObject[@"list"];
        NSMutableArray  *arrRightItem= [ZPRigthItem mj_objectArrayWithKeyValuesArray:array];
        
        self.arrRightItem=arrRightItem;
        self.leftItem.total_page=responseObject[@"total_page"];
        
        [self.leftItem.arrM addObjectsFromArray:arrRightItem];
        
        [self.rigthTableV reloadData];
        
        self.rigthTableV.mj_footer.hidden=self.leftItem.page>[self.leftItem.total_page integerValue] ;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.rigthTableV.mj_footer endRefreshing ];
        
    }];
    
    
    
    
    
    
}



/** 请求数据 */
- (void)loadleftData
{
    
    
    //创建请求管理对象
    AFHTTPSessionManager  *manager=[AFHTTPSessionManager ZP_Manager];
    
    //拼接参数
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    
    dict[@"a"]=@"category";
    dict[@"c"]=@"subscribe";
    
    //发送请求
    [manager zp_GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        
        [self.rigthTableV.mj_header endRefreshing];
        
        NSArray *array=responseObject[@"list"];
        NSMutableArray  *arrleftItem= [ZPLeftItem mj_objectArrayWithKeyValuesArray:array];
        
        self.arrleftItem=arrleftItem;
        
        [self.leftTableV reloadData];
        
        
        NSIndexPath *index=[NSIndexPath indexPathForRow:0 inSection:0];
        [self.leftTableV selectRowAtIndexPath:index animated:YES scrollPosition: UITableViewScrollPositionNone];
        
        [self tableView:self.leftTableV didSelectRowAtIndexPath:index];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.rigthTableV.mj_header endRefreshing];
        
        
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==self.leftTableV)
    {
        return self.arrleftItem.count;
    }else
    {
        
        
        return self.leftItem.arrM.count;
        
    }
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==self.leftTableV){
        ZPLeftTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:leftID];
        
        cell.leftItem=self.arrleftItem[indexPath.row];
        return cell;
    }else{
        
        ZPRigthTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rightID];
        
        cell.rigthItem=self.leftItem.arrM[indexPath.row];
        return cell;
        
    }
    
    return nil;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==self.leftTableV)
        
    {
        self.leftItem =self.arrleftItem[indexPath.row];
        
        
        if(self.leftItem.arrM.count==0){
            
            
            [self loadrightData];
            [self.rigthTableV.mj_header beginRefreshing];
            
        }else{
            [self.rigthTableV reloadData];
            
        }
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==self.leftTableV)
    {
        return 40;
    }
    else{
        
        return 80;
    }
    
    
}

@end
