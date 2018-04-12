//
//  Payfor_phone.m
//  WSTD_app
//
//  Created by 宝视达 on 2018/3/28.
//  Copyright © 2018年 baoshida. All rights reserved.
//

#import "Payfor_phone.h"

@implementation Payfor_phone

-(void)SetwithString:(NSString *)str1
           withString2:(NSString *)str2;{
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 20.0f;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 20.0f;
    [self.layer setBorderColor:[kRGB(238, 83, 84) CGColor]];
    UILabel *lab1= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, kScaleWidth(30))];
    lab1.text = str1;
    lab1.font=[UIFont systemFontOfSize:15];
    lab1.tintColor = [UIColor blackColor];
    lab1.textAlignment= NSTextAlignmentCenter;
    
    UILabel *lab2= [[UILabel alloc]initWithFrame:CGRectMake(0, 30, self.frame.size.width, kScaleWidth(20))];
    lab2.text = str2;
    lab2.font=[UIFont systemFontOfSize:12];
    lab2.tintColor = kRGB(147, 153, 155);
    lab2.textAlignment= NSTextAlignmentCenter;
    [self addSubview:lab1];
    [self addSubview:lab2];
}


@end
