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
@property (strong, nonatomic)WKWebView *webV;

@end

@implementation ZPWkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webV=[[WKWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    
    
    self.webV=webV;
    [webV loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

- (IBAction)backBtnClick:(UIBarButtonItem *)sender {
    if ([self.webV  canGoBack]) {
         [self.webV goBack];
    }
   
    
}

- (IBAction)forwardBtnClick:(UIBarButtonItem *)sender {
    if ([self.webV canGoForward]) {
        [self.webV goForward];
    }
    
}
- (IBAction)roldBtnClick:(id)sender {
    
    [self.webV reload];
    
    
}

@end
