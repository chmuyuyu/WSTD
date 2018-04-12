//
//  PLBadgeButton.h
//  YiKuaiYunGou
//
//  Created by 彭亮 on 16/3/12.
//  Copyright © 2016年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLBadgeButton : UIButton
//设置角标值
@property (nonatomic) NSString *badgeValue;
//角标背景色
@property (nonatomic) UIColor *badgeBGColor;
//角标文字颜色
@property (nonatomic) UIColor *badgeTextColor;
//角标字体font
@property (nonatomic) UIFont *badgeFont;
//角标内边距
@property (nonatomic) CGFloat badgePadding;
//角标最小值
@property (nonatomic) CGFloat badgeMinSize;

@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;

//清空角标
@property BOOL shouldHideBadgeAtZero;

@property BOOL shouldAnimateBadge;
@end
