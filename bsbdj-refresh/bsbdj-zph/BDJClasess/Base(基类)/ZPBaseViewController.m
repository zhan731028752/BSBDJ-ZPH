//
//  ZPBaseViewController.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/14.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPBaseViewController.h"
#import "AllcontrollerVC.h"
#import "VideocontrollerVC.h"
#import "SoundcontrollerVC.h"
#import "PiccontrollerVC.h"
#import "CrossControllerVC.h"
#import "ZPBaseessencVC.h"
@interface ZPBaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property(nonatomic,weak)UIButton *selectBtn;

@property(nonatomic,weak)UICollectionView  *collectionView;

@property(nonatomic,strong)NSMutableArray *arrBtns;

@property(nonatomic,weak)UIView *lineV;

@end

static NSString * const ID=@"CELL";

@implementation ZPBaseViewController

-(NSMutableArray *)arrBtns
{
    if (_arrBtns==nil) {
        
        _arrBtns=[NSMutableArray array];
    }
    return _arrBtns;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor redColor];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //添加所有的子控制器
    [self addAllChildController];
    
    [self setUpCollectionView];
    
    [self setUpnavigationBarsViewAddTabarBtns];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    
    //当切换按钮点击的时候让他刷新
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshData) name:@"tabbarBtnClick" object:nil];
    
}

- (void)refreshData
{
    
   
    ZPBaseessencVC *vc=self.childViewControllers[self.selectBtn.tag];
       if(vc.view.window)
    {
        
        [vc.tableView.mj_header beginRefreshing];
        
    }
}
//移除通知
-(void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


- (void)addAllChildController
{
    
    
    
}


- (void)setUpnavigationBarsViewAddTabarBtns
{
    UIView *barV=[[UIView alloc]init];
  
    barV.frame=CGRectMake(0, 64, ScreenW, 35);
    barV.backgroundColor=[UIColor whiteColor];
    
    [self.view  addSubview:barV];
    
    //     int i=0;
    NSInteger count=self.childViewControllers.count;
    CGFloat x=0;
    CGFloat y=0;
    CGFloat w=barV.width/count;
    CGFloat h=barV.hight;
    
    for(int i=0; i<self.childViewControllers.count;i++)
    {
        //    for (UIViewController *vc in self.childViewControllers)
        //    {
        
        UIViewController *vc=self.childViewControllers[i];
        UIButton *btn=[[UIButton alloc]init];
        
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitle:vc.title forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        [self.arrBtns addObject:btn];
        
        [btn  addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i;
        x=i*w;
        btn.frame=CGRectMake(x, y, w, h);
        [barV addSubview:btn];
        if (i==0) {
            [self selectBtnClick:btn];
            UIView *lineV=[[UIView alloc]init];
            lineV.hight=1;
            lineV.backgroundColor=[UIColor redColor];
            [btn.titleLabel sizeToFit];
            lineV.width=btn.titleLabel.width;
            lineV.centerX=btn.centerX;
            lineV.y=btn.hight-lineV.hight;
            self.lineV=lineV;
            
            [barV addSubview:lineV];
        }
        
        
    }
    
}


- (void)titleBtnClick:(UIButton*)btn
{
    //多次点击按钮的时候刷新
    if(self.selectBtn==btn)
    {
        ZPBaseessencVC *vc=self.childViewControllers[btn.tag];
        [vc.tableView.mj_header beginRefreshing];
    }
    [self selectBtnClick:btn];
    self.collectionView.contentOffset=CGPointMake(btn.tag*ScreenW, 0);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.lineV.centerX=btn.centerX;
    }];
    
}


- (void)selectBtnClick:(UIButton *)btn
{
    
    
    self.selectBtn.selected=NO;
    
    btn.selected=YES;
    
    self.selectBtn=btn;
    
    
}

#pragma mark setUpCollectionView
- (void)setUpCollectionView
{
    //创建流水布局
    UICollectionViewFlowLayout  *lyt=[[UICollectionViewFlowLayout alloc]init];
    
    //设置每个cell的大小
    lyt.itemSize=[UIScreen mainScreen].bounds.size;
    
    lyt.minimumLineSpacing=0;
    
    lyt.minimumInteritemSpacing=0;
    
    //设置滚动方向
    lyt.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView  *collectionView=[[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:lyt];
    self.collectionView=collectionView;
    //禁止弹性
    collectionView.bounces=NO;
    
    //开启分页
    collectionView.pagingEnabled=YES;
    
    collectionView.delegate=self;
    collectionView.dataSource=self;
    
    [self.view addSubview:collectionView];
}


//实现代理方法和数据源方法
//<UICollectionViewDelegate,UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSInteger count  = self.childViewControllers.count;
    
    return count;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSInteger  a=arc4random_uniform(256);
    NSInteger  b=arc4random_uniform(256);
    NSInteger  c=arc4random_uniform(256);
    
    cell.backgroundColor=[UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIViewController *vc=self.childViewControllers[indexPath.item];
    vc.view.frame=[UIScreen mainScreen].bounds;
    UITableView *tableView=(UITableView *)vc.view;
    
    tableView.contentInset=UIEdgeInsetsMake(99, 0, 44, 0);
    [cell.contentView addSubview:vc.view];
    return cell;
    
}

//滚动停止的时候改变对应按钮的状态
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger index=scrollView.contentOffset.x/ScreenW;
    
    [self titleBtnClick:self.arrBtns[index]];
}
@end
