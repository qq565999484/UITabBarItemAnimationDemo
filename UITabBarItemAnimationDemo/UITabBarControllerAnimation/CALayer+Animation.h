//
//  CALayer+Animation.h
//  Beauty
//
//  Created by chenyh on 16/7/26.
//  Copyright © 2016年 chenyh. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>


/**
 *  动画效果是随便写的,如果想要更炫酷的 那只能自己去写咯。
 */

@interface CALayer (Animation)

/**
 *  一个类似心跳的动画效果...
 */
- (void)addHeartthrobAnimation;
/**
 *  一个平移位置的动画
 */
- (void)addMoveInAnimation;
/**
 *  瞬间放大的效果
 */
- (void)addScale;
/**
 *  左右抖动
 */
- (void)addLeftAndRightShake;
/**
 *  摇动
 */
-(void)shake;
@end
