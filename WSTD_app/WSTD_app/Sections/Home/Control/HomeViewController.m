//
//  HomeViewController.m
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/26.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import "HomeViewController.h"
#import "Masonry.h"
#import "HomeFirst_Cell.h"
#import "CalliDCardViewController.h"
#import "PayMoneyViewController.h"
@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)creatUI{
#define 头部不动组件
    //View
    UIView *payMoney = [[UIView alloc] init];
    payMoney.backgroundColor=kRGB(238, 83, 84);
    [self.view addSubview:payMoney];
    [payMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth, kScaleHeight(200)))));
    }];
    //铃铛
    UIButton *bell = [[UIButton alloc]init];
    [bell setBackgroundImage:[UIImage imageNamed:@"bell"] forState:UIControlStateNormal];
    [payMoney addSubview:bell];
    [bell mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(30);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScaleWidth(20), kScaleHeight(20)))));
    }];
    //扫码
    UIButton *scan = [[UIButton alloc]init];
    [scan setBackgroundImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
    [payMoney addSubview:scan];
    [scan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(30);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScaleWidth(20), kScaleHeight(20)))));
    }];
    //testFild 收款数
    UILabel *ReceivablesNub =[[UILabel alloc]init];
    [payMoney addSubview:ReceivablesNub];
    ReceivablesNub.tintColor = [UIColor whiteColor];
    ReceivablesNub.text=@"今日收款0笔，合计";
    ReceivablesNub.font = [UIFont fontWithName:@"Arial" size:17.0f];
    ReceivablesNub.textColor = [UIColor whiteColor];
    ReceivablesNub.textAlignment = NSTextAlignmentCenter;
    [ReceivablesNub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scan.mas_bottom).with.offset(10);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth, kScaleHeight(20)))));
    }];
    //testFild 收款金额
    UILabel *ReceivablesMoney =[[UILabel alloc]init];
    [payMoney addSubview:ReceivablesMoney];
    ReceivablesMoney.tintColor = [UIColor whiteColor];
    ReceivablesMoney.text=@"0.00";
    ReceivablesMoney.font = [UIFont boldSystemFontOfSize:24];
    ReceivablesMoney.textColor = [UIColor whiteColor];
    ReceivablesMoney.textAlignment = NSTextAlignmentCenter;
    [ReceivablesMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ReceivablesNub.mas_bottom).with.offset(5);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth, kScaleHeight(20)))));
    }];
    //收款button
    JXLayoutButton *Receivables =[self addButton:[self generateButtonWithStyle:JXLayoutButtonStyleUpImageDownTitle withNameString:@"收款"
        withImgString:@"icon_home_bill" ]
        withSEL:@selector(btnPaymoney)];
    [Receivables mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.equalTo(ReceivablesMoney.mas_bottom).with.offset(20);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth/3, kScaleHeight(70)))));
    }];
    //订单流水Reconciliation
    JXLayoutButton *Reconciliation =[self addButton:[self generateButtonWithStyle:JXLayoutButtonStyleUpImageDownTitle withNameString:@"订单流水"
        withImgString:@"icon_home_orderflow" ]
        withSEL:@selector(btnPaymoney)];
    [Reconciliation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Receivables.mas_right).with.offset(0);
        make.top.equalTo(ReceivablesMoney.mas_bottom).with.offset(20);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth/3, kScaleHeight(70)))));
    }];
    //对账Order
    JXLayoutButton *Order =[self addButton:[self generateButtonWithStyle:JXLayoutButtonStyleUpImageDownTitle withNameString:@"对账"
        withImgString:@"icon_home_reportform" ]
        withSEL:@selector(btnPaymoney)];
    [Order mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Reconciliation.mas_right).with.offset(0);
        make.top.equalTo(ReceivablesMoney.mas_bottom).with.offset(20);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth/3, kScaleHeight(70)))));
    }];
    
    //tableview
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    [_tableView registerClass:[HomeFirst_Cell class] forCellReuseIdentifier:@"HomeFirst_Cell"];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(payMoney.mas_bottom).with.offset(0);
        make.size.equalTo(MASBoxValue((CGSizeMake(kScreenWidth, kScaleHeight(200)))));

    }];
    
    
    
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
        return kScreenWidth/3;
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeFirst_Cell *cell = [[HomeFirst_Cell alloc]init];
    cell.pay_iphone=^{
        PayMoneyViewController *calliDCardViewControlle =[[PayMoneyViewController alloc]init];
        UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:calliDCardViewControlle];
        [self presentViewController:vc animated:YES completion:nil];
    };
    cell.callidCard=^{
        CalliDCardViewController *calliDCardViewControlle =[[CalliDCardViewController alloc]init];
        UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:calliDCardViewControlle];
        [self presentViewController:vc animated:YES completion:nil];
    };
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#define JXButton按钮直接调用
- (JXLayoutButton *)generateButtonWithStyle:(JXLayoutButtonStyle)style withNameString:(NSString *)NameString  withImgString:(NSString*)ImgString{
    JXLayoutButton *button = [JXLayoutButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:ImgString] forState:UIControlStateNormal];
    [button setTitle:NameString forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layoutStyle = style;
    
    return button;
}
- (JXLayoutButton*)addButton:(JXLayoutButton *)button  withSEL:(SEL )str{
    [button addTarget:self action:str forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}
#define 收款点击事件
-(void)btnPaymoney{
}
@end
