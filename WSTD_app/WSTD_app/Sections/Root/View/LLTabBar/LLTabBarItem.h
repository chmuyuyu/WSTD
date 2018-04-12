//
//  LLTabBarItem.h
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLBadgeButton.h"
typedef NS_ENUM(NSUInteger, LLTabBarItemType) {
	LLTabBarItemNormal = 0,
	LLTabBarItemRise,
};

@interface LLTabBarItem : PLBadgeButton

@property (nonatomic, assign) LLTabBarItemType tabBarItemType;

@end
