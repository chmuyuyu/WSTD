//
//  TabBarController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "TabBarController.h"

#import "PersonalViewController.h"
#import "HomeViewController.h"
#import "LLTabBar.h"
#import "LLTabBarItem.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.tabBar.tintColor = BASE_COLOR;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    HomeViewController * homeVC = [HomeViewController  new];
    homeVC.title = @"首页";
    
    PersonalViewController * personalVC = [PersonalViewController new];
    personalVC.title = @"我的";

    self.viewControllers =
  @[[self navigationControllerWithViewController:homeVC imgName:@"tabbar_discover"],
    [self navigationControllerWithViewController:personalVC imgName:@"tabbar_me"]];
  
}

- (UINavigationController *)navigationControllerWithViewController:(UIViewController *)vc imgName:(NSString *)imgName {
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:vc.title
                                                  image:
                      [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                          selectedImage:
                      [[UIImage imageNamed: [NSString stringWithFormat:@"%@HL", imgName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
