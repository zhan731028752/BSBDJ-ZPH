//
//  ZPMineTableVC.m
//  bsbdj-zph
//
//  Created by admin on 16/12/4.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPMineTableVC.h"
#import "ZPSettingTableVc.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "ZPMineItem.h"
#import "ZPMiCollectionViewCell.h"
#import <SafariServices/SafariServices.h>
#import "ZPWkViewController.h"
@interface ZPMineTableVC ()<UICollectionViewDelegate,UICollectionViewDataSource,SFSafariViewControllerDelegate>
@property(nonatomic,strong)NSMutableArray *arrItem;

@property(nonatomic,weak)UICollectionView  *collectionView;

@property(nonatomic,assign)NSInteger lines;

@property(nonatomic,assign)CGFloat WH;
@end
static NSString   * const ID=@"CELL";


@implementation ZPMineTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionFooterHeight=10;
    self.tableView.sectionHeaderHeight=0;
    self.tableView.contentInset=UIEdgeInsetsMake(-30, 0, 0, 0 );
    //    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    //    NSLog(@"%lf",self.tableView.contentOffset.y);
    [self setUpNav];
    
    [self setUpCollectionView];
    
    [self loadData];
}

//加载数据
- (void)loadData
{
    //创建会话管理对象
    AFHTTPSessionManager *manager=[AFHTTPSessionManager ZP_Manager];
    //拼接参数
    NSMutableDictionary *dictM=[NSMutableDictionary dictionary];
    
    NSString *url=@"http://api.budejie.com/api/api_open.php";
    
    dictM[@"a"]=@"square";
    dictM[@"c"]=@"topic";
    
    //发送请求
    [manager zp_GET:url parameters:dictM progress:nil success:^(NSURLSessionDataTask *task, NSDictionary* responseObject) {
        
        NSArray *arrData=responseObject[@"square_list"];
        //转模型
        NSMutableArray  *arrItem=[ZPMineItem mj_objectArrayWithKeyValuesArray:arrData];
        
        self.arrItem=arrItem;
        
        //计算总行数=（总数-1）／列数+1；
        NSUInteger rows=(self.arrItem.count-1)/self.lines+1;
        
        self.collectionView.hight=(self.WH+1)*rows;
        //补全格子
        NSInteger con=arrItem.count%(self.lines);
        for (int i=0;i<con; ++i)
        {ZPMineItem *item=[[ZPMineItem alloc]init];
            [self.arrItem addObject:item];
        }
        self.tableView.tableFooterView=self.collectionView;
        
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
//设置CollectionView的布局
- (void)setUpCollectionView
{
    UICollectionViewFlowLayout *flt=[[UICollectionViewFlowLayout alloc]init];
    
    NSInteger lines=4;
    NSInteger space=1;
    self.lines=lines;
    
    CGFloat WH=(ScreenW-(lines-1)*space)/lines;
    self.WH=WH;
    flt.itemSize=CGSizeMake(WH, WH);
    
    flt.minimumLineSpacing=space;
    
    flt.minimumInteritemSpacing=space;
    
    UICollectionView  *collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:flt];
    
    collectionView.delegate=self;
    
    collectionView.dataSource=self;
    
    self.collectionView=collectionView;
    collectionView.backgroundColor=[UIColor clearColor];
    [collectionView registerClass:[ZPMiCollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.tableView.tableFooterView=collectionView;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.arrItem.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZPMiCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor=[UIColor whiteColor];
    ZPMineItem *item=self.arrItem[indexPath.item];
    cell.item=item;
    
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"%@",NSStringFromCGRect(cell.frame));
//
//}

//-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller
//{
//    
//    self.navigationController.navigationBar.hidden=NO;
//    [self.navigationController popViewControllerAnimated:YES];
//
//
//}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZPMineItem *item=self.arrItem[indexPath.item];
   
    ZPWkViewController *wkV=[[ZPWkViewController alloc]init];
    wkV.url=item.url;
    if([item.url hasPrefix:@"http"]){
        [self.navigationController pushViewController:wkV animated:YES];
        
    }else{
        
    };
}
//设置导航条
-(void)setUpNav
{
    
    //设置中间视图
    self.navigationItem.title=@"我的";
    
    //设置导航条右侧
    
    //夜间按钮
    UIBarButtonItem *nightBtn=[UIBarButtonItem BarButtonItemWithNormalName:@"mine-sun-icon" SelectedN: @"mine-sun-icon-click" target:self action:@selector(nightBtnClick)];
    
    //设置按钮
    UIBarButtonItem *settingBtn=[UIBarButtonItem BarButtonItemWithNormalName:@"mine-setting-icon" HighlightN:@"mine-setting-icon-click" target:self action:@selector(settingBtnClick)];
    
    self.navigationItem.rightBarButtonItems=@[settingBtn,nightBtn];
}


- (void)nightBtnClick{
    
    
}

- (void)settingBtnClick
{
    ZPSettingTableVc  *vc=[[ZPSettingTableVc alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
