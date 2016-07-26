//
//  AppDelegate.m
//  UITabBarItemAnimationDemo
//
//  Created by chenyh on 16/7/26.
//  Copyright © 2016年 chenyh. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabBarController.h"

#define __MainScreenFrame [UIScreen mainScreen].bounds
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    CustomTabBarController *customTabBarC = [CustomTabBarController new];
    [self setApp];
    self.window.rootViewController = customTabBarC;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)setApp{

    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

}


/**
 *  这是一个给 启动图加动画的
 */
- (void)addAnimation
{
    NSString * viewOrientation = @"Portrait";
    NSString * launchImage = nil;
    NSArray * imageDict = [[[NSBundle mainBundle] infoDictionary]valueForKey:@"UILaunchImages"];
    for (NSDictionary  * dict in imageDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, __MainScreenFrame.size) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImage = dict[@"UILaunchImageName"];

        }
    }
    NSLog(@"==luanch = %@",launchImage);

    UIImageView * luanchView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:launchImage]];
    self.window.backgroundColor = [UIColor whiteColor];
    luanchView.frame = self.window.bounds;
    luanchView.contentMode = UIViewContentModeScaleAspectFill;
    [self.window addSubview:luanchView];
    [UIView animateWithDuration:2.0f delay:1.0f usingSpringWithDamping:0.5f initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        luanchView.alpha = 0.0f;
        luanchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.8, 0.8, 1);

    } completion:^(BOOL finished) {
        luanchView.layer.transform = CATransform3DIdentity;
        [luanchView removeFromSuperview];
    }];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
