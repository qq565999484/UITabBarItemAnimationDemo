//
//  UITabBarController+Swizzing.m
//  Beauty
//
//  Created by chenyh on 16/7/26.
//  Copyright © 2016年 chenyh. All rights reserved.
//

#import "UITabBarController+Swizzing.h"
#import "CALayer+Animation.h"
#import <objc/runtime.h>


/**
 *  这个也可以单独写出来到特定的TabBarController中
 */

@implementation UITabBarController (Swizzing)

+ (void) load
{
    [super load];

    Method fromMethod = class_getInstanceMethod([self class], @selector(tabBar:didSelectItem:));

    Method toMethod = class_getInstanceMethod([self class], @selector(tabBarSwizzing:didSelectItem:));

    if (!class_addMethod([self class], @selector(tabBar:didSelectItem:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }

}

- (void)tabBarSwizzing:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSMutableArray *arrayBt = [NSMutableArray array];
    for (id tabBt in [tabBar subviews]){
        NSLog(@"~~~~~~~%@",tabBt);

        if ([tabBt isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [arrayBt addObject:tabBt];}
    }

    //如果要给整个UITabBarButton加动画就给tabBt单独加哦

    UIView *view =  [arrayBt objectAtIndex:[tabBar.items indexOfObject:item]];
    int i=0;
    for (id tmp in [view subviews])

    {
        NSLog(@"--------%@",tmp);
        i++;
        if ([tmp isKindOfClass:NSClassFromString( @"UITabBarSelectionIndicatorView")]){break;}
    }

    [[[[view subviews] objectAtIndex:i-1] layer] addLeftAndRightShake];
    

}




@end
