//
//  PayMoneyViewController.m
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/28.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import "PayMoneyViewController.h"
#import "SolPayViewController.h"
@interface PayMoneyViewController ()

@end

@implementation PayMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回"style:UIBarButtonItemStyleDone target:self action:@selector(GetBack)];
    [leftItem setTintColor:kRGB(255, 83, 84)];
    self.navigationItem.leftBarButtonItem =leftItem;
    self.title=@"充值方式";
    [super viewDidLoad];
    [self creatUI];
}
-(void)creatUI{
    UIButton*qkbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [qkbtn setTitle:@"快速充值" forState:UIControlStateNormal];
    qkbtn.layer.cornerRadius = 14.0f;
    qkbtn.backgroundColor = kRGB(238, 83, 84);
    qkbtn.layer.masksToBounds = YES;
    [self.view addSubview:qkbtn];
    
    UIButton*solbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [solbtn setTitle:@"线下慢充" forState:UIControlStateNormal];
    solbtn.layer.cornerRadius = 14.0f;
    solbtn.backgroundColor = kRGB(238, 83, 84);
    solbtn.layer.masksToBounds = YES;
    [self.view addSubview:solbtn];
    [solbtn addTarget:self action:@selector(solPayMoney) forControlEvents:UIControlEventTouchUpInside];
    
    //付款90 https://spay3.swiftpass.cn/spay/merchant/scanQr?qrId=a7a37f94-c979-43ca-b392-8cb31d6b50ae&amp;fixMoney=9000
    //付款180 https://spay3.swiftpass.cn/spay/merchant/scanQr?qrId=a7a37f94-c979-43ca-b392-8cb31d6b50ae&amp;fixMoney=18000
    UILabel *label = [[UILabel alloc]init];
    label.text = @"充值介绍:";
    label.font=[UIFont boldSystemFontOfSize:20];
    label.textAlignment = NSTextAlignmentLeft;
    label.tintColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    UILabel *lab2 =[[UILabel alloc]init];
    lab2.text=@"快速充值：走线上进行手机话费充值，费率较高无法进行充值优惠\n线下充值:走线下人工进行话费充值，提供9折优惠！";
    lab2.textAlignment = NSTextAlignmentLeft;
    lab2.font=[UIFont systemFontOfSize:14];
    
    lab2.numberOfLines = 0;
    lab2.tintColor = [UIColor blackColor];
    [self.view addSubview:lab2];

    [qkbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kScreenHeight/5);
        make.left.mas_offset(kScreenWidth/12);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth/3, kScaleHeight(40)))));
    }];
    [solbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kScreenHeight/5);
        make.right.mas_offset(-kScreenWidth/12);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth/3, kScaleHeight(40)))));
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(solbtn.mas_bottom).with.offset(kScreenHeight/4);
        make.left.mas_offset(0);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth-20, 20))));
    }];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).with.offset(0);
        make.left.mas_offset(10);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth-10, 70))));
    }];
}
//返回事件
-(void)GetBack{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)solPayMoney{
    SolPayViewController *vc = [[SolPayViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
