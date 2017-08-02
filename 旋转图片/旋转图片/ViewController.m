//
//  ViewController.m
//  旋转图片
//
//  Created by lee on 2017/7/19.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ViewController.h"
#import "UIView+i7Rotate360.h"
#import "AView.h"
#import "UIImageView+Rotation.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imagView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    a. 让图片360° 旋转，只需调用rotate360DegreeWithImageView该方法，如下
    
//    [self.imagView1 rotate360DegreeWithImageView];
    
//    b. 停止旋转, 调用stopRotate，如下
    
//    [imageView stopRotate]；
    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
//    anima.toValue = [NSNumber numberWithFloat:M_PI*2];
//    anima.duration = 2.0f;
//    [self.imageView1.layer addAnimation:anima forKey:@"rotateAnimation"];
    
    
//    CAKeyframeAnimation *path=[CAKeyframeAnimation animationWithKeyPath:@"position"];
//    //矩形的中心就是圆心
//    path.duration=5;
//    //绕此圆中心转
//    path.path=CFAutorelease(CGPathCreateWithEllipseInRect(rect, NULL));
//    path.calculationMode=kCAAnimationPaced;
//    path.rotationMode=kCAAnimationRotateAuto;
//    [self.imagView1.layer addAnimation:path forKey:@"round"];
    
    
//    AView *aView = [[AView alloc] initWithImage:[UIImage imageNamed:@"sector"]];
//    aView.frame = CGRectMake(122,170,75,75);
//    aView.userInteractionEnabled = YES;
//    [self.view addSubview:aView];
//    
//    [aView rotate360WithDuration:0.5 repeatCount:3 timingMode:i7Rotate360TimingModeLinear];
}
- (IBAction)begin:(id)sender {
    [self.imagView1 clearAnimations];
    [self.imagView1 rotateImageView];
}
//[self pauseLayer:self.imagView1.layer];
- (IBAction)stop:(id)sender {
    [self.imagView1 pauseRotate];
}

- (IBAction)pause:(id)sender {
    [self.imagView1 pauseRotate];
}

- (IBAction)resume:(id)sender {
    [self.imagView1 resumeRotate];
}


//
//- (void)rotateImageView;
//- (void)pauseRotate;
//- (void)resumeRotate;
//- (void)clearAnimations;  //清空所有动画



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
