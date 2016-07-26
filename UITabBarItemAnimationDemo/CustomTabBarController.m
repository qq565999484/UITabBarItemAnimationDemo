//
//  CustomTabBarController.m
//  UITabBarItemAnimationDemo
//
//  Created by chenyh on 16/7/26.
//  Copyright © 2016年 chenyh. All rights reserved.
//

#import "CustomTabBarController.h"
#import "UITabBarController+Swizzing.h"
#import "HomeViewController.h"
#import "PlayViewController.h"
#import "PersonCenterViewController.h"

@implementation CustomTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];

    HomeViewController *homeVC = [HomeViewController new];
    homeVC.title = @"首页";
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"0"] selectedImage:[UIImage imageNamed:@"1"]];


    PlayViewController *playVC = [PlayViewController new];
    playVC.title = @"乐趣";
    UINavigationController *playNav = [[UINavigationController alloc] initWithRootViewController:playVC];
    playNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"2"] selectedImage:[UIImage imageNamed:@"3"]];


    PersonCenterViewController *personCenterVC = [PersonCenterViewController new];
    personCenterVC.title = @"个人中心";
    UINavigationController *personCenterNAV = [[UINavigationController alloc] initWithRootViewController:personCenterVC];
    
    personCenterNAV.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"2"] selectedImage:[UIImage imageNamed:@"3"]];

    self.viewControllers = @[homeNav,playNav,personCenterNAV];
    self.selectedIndex = 0;
}





@end
