//
//  HomeFirst_Cell.h
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/26.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXLayoutButton.h"
typedef void (^CallidCard)();
typedef void (^Pay_iphone)();

@interface HomeFirst_Cell : UITableViewCell

@property(nonatomic,strong)    CallidCard callidCard;
@property(nonatomic,strong)    Pay_iphone pay_iphone;


@end
