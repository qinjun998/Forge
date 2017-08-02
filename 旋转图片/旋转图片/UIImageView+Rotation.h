//
//  UIImageView+RotateImgV.h
//  RotateImgV
//
//  Created by Ashen on 15/11/10.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Rotation)
//rotate360DegreeWithImageView
- (void)rotateImageView;
- (void)pauseRotate;
- (void)resumeRotate;
- (void)clearAnimations;  //清空所有动画

@end
