//
//  ZPWkViewController.m
//  bsbdj-zph
//
//  Created by Apple on 2016/12/10.
//  Copyright © 2016年 FMB. All rights reserved.
//

#import "ZPWkViewController.h"
#import <WebKit/WebKit.h>
@interface ZPWkViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIView *contenV;
@property (strong, nonatomic)WKWebView *webV;

@end

@implementation ZPWkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webV=[[WKWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    
    [self.contenV addSubview:webV];
    self.webV=webV;
    [webV loadRequest:request];
    
    [webV addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [webV addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
  
      [webV addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
}


//返回
- (IBAction)backBtnClick:(UIBarButtonItem *)sender {
    
    if ([self.webV  canGoBack]) {
         [self.webV goBack];
    }
   
    
}

//前进
- (IBAction)forwardBtnClick:(UIBarButtonItem *)sender {
    
    
    if ([self.webV canGoForward]) {
        [self.webV goForward];
    }
    
}

//刷新
- (IBAction)roldBtnClick:(id)sender {
    
    [self.webV reload];
    
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
   // self.navigationController.navigationBar.hidden=YES;
    self.progress.progress=self.webV.estimatedProgress;
    
    self.progress.hidden= self.progress.progress==1?YES:NO;
    
  //设置是否可以前进和回退
    self.back.enabled=[self.webV canGoBack];
    
    self.forward.enabled=[self.webV canGoForward];

}

//移除kvo监听，不然释放不了
-(void)dealloc
{

    [self.webV removeObserver:self forKeyPath:@"estimatedProgress"];
    
    [self.webV removeObserver:self forKeyPath:@"canGoBack"];
    
    [self.webV removeObserver:self forKeyPath:@"canGoForward"];

}
@end
