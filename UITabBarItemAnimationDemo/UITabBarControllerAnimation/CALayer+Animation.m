//
//  CALayer+Animation.m
//  Beauty
//
//  Created by chenyh on 16/7/26.
//  Copyright © 2016年 chenyh. All rights reserved.
//

#import "CALayer+Animation.h"

@implementation CALayer (Animation)

- (void)addHeartthrobAnimation
{


        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];



        CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);

        CATransform3D scale2 = CATransform3DMakeScale(1.0, 1.0, 1);

        CATransform3D scale3 = CATransform3DMakeScale(1.0 - 0.3f, 1.0 - 0.3f, 1);

        CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);



        NSArray *frameValues = [NSArray arrayWithObjects:

                                [NSValue valueWithCATransform3D:scale1],

                                [NSValue valueWithCATransform3D:scale2],

                                [NSValue valueWithCATransform3D:scale3],

                                [NSValue valueWithCATransform3D:scale4],

                                nil];



        [animation setValues:frameValues];



        NSArray *frameTimes = [NSArray arrayWithObjects:

                               [NSNumber numberWithFloat:0.05],

                               [NSNumber numberWithFloat:0.2],

                               [NSNumber numberWithFloat:0.6],

                               [NSNumber numberWithFloat:1.0],

                               nil];
        
        [animation setKeyTimes:frameTimes];
        
        
        
        animation.fillMode = kCAFillModeForwards;
        
        animation.duration = 1.0;
        
        animation.repeatCount = 1;
        
        if ([self animationForKey:@"itemScale"]) {
            [self removeAnimationForKey:@"itemScale"];
        }
        [self addAnimation:animation forKey:@"itemScale"];
        
}

- (void)addMoveInAnimation{

        CATransition *transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromBottom;
    
        if ([self animationForKey:@"moveIn"]) {
            [self removeAnimationForKey:@"moveIn"];
        }
        [self addAnimation:transition forKey:@"moveIn"];

}


- (void)addScale
{

    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values =  @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    if ([self animationForKey:@"transformscale"]) {
        [self removeAnimationForKey:@"transformscale"];
    }
    [self addAnimation:k forKey:@"transformscale"];


}

- (void)addLeftAndRightShake
{

    CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
    keyAnimaion.keyPath = @"transform.rotation";
    keyAnimaion.values = @[@(-10 / 180.0 * M_PI),@(10 /180.0 * M_PI),@(-10/ 180.0 * M_PI)];//度数转弧度

    keyAnimaion.removedOnCompletion = NO;
    keyAnimaion.fillMode = kCAFillModeForwards;
    keyAnimaion.duration = 0.3;
    keyAnimaion.repeatCount = 1;
    [keyAnimaion setRemovedOnCompletion:YES];
    if ([self animationForKey:@"transformrotation"]) {
        [self removeAnimationForKey:@"transformrotation"];
    }
    [self addAnimation:keyAnimaion forKey:@"transformrotation"];

}


/*
 *  摇动
 */
-(void)shake{

    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];

    CGFloat s = 16;

    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];

    //时长
    kfa.duration = .1f;

    //重复
    kfa.repeatCount = 1;

    //移除
    kfa.removedOnCompletion = YES;

    [self addAnimation:kfa forKey:@"shake"];
}


@end
