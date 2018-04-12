//
//  CalliDCardViewController.m
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/27.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import "CalliDCardViewController.h"

@interface CalliDCardViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webVieww;
@property (nonatomic,strong) MBProgressHUD *HUD;

@end

@implementation CalliDCardViewController

- (void)viewDidLoad {
    self.title= @"办理信用卡";
    _webVieww = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    _webVieww.delegate =self;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://creditcard.ecitic.com/h5/shenqing/shanghu/yika.html?sid=SJOSZWSTD"]]];
    [self.view addSubview: _webVieww];
    [_webVieww loadRequest:request];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回"style:UIBarButtonItemStyleDone target:self action:@selector(GetBack)];
    [leftItem setTintColor:kRGB(255, 83, 84)];
    self.navigationItem.leftBarButtonItem =leftItem;
    [self GeneralButtonAction];
    [super viewDidLoad];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_HUD removeFromSuperview];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
}
//   通常情况  文字  加 菊花
- (void)GeneralButtonAction{
    //初始化进度框，置于当前的View当中
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    
    //如果设置此属性则当前的view置于后台
    _HUD.dimBackground = YES;
    
    //设置对话框文字
    _HUD.labelText = @"加载中";
    //细节文字
    _HUD.detailsLabelText = @"请耐心等待";
    [_HUD show:YES];
    //显示对话框
   // [_HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
     //   sleep(3);
    //}// 在HUD被隐藏后的回调
     //  completionBlock:^{
           //操作执行完后取消对话框
           //[_HUD removeFromSuperview];
          // _HUD = nil;
      // }];
}
//返回事件
-(void)GetBack{
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
