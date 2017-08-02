//
//  UIImageView+RotateImgV.m
//  RotateImgV
//
//  Created by Ashen on 15/11/10.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "UIImageView+Rotation.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@implementation UIImageView (Rotation)

- (void)rotateImageView {
    CABasicAnimation * rotationAnimation= [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 100000;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)pauseRotate{
    [self pauseLayer:self.layer];
}
- (void)resumeRotate{
     [self resumeLayer:self.layer];
}


//清空所有动画
- (void)clearAnimations {
    [self.layer removeAllAnimations];
}

-(void)pauseLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}
//继续layer上面的动画
-(void)resumeLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}


@end
