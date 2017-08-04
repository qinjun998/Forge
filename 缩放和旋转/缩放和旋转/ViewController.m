//
//  ViewController.m
//  缩放和旋转
//
//  Created by lee on 2017/8/4.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger,YSYDirection) {
    YSYDirectionUp = 0,
    YSYDirectionLeft,
    YSYDirectionDown,
    YSYDirectionRight
};


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVision;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *lblShow;

@property (assign, nonatomic)  int totalAngleValue;    //累计角度值
@property (assign, nonatomic)  YSYDirection direction;  //实际方向
@end

@implementation ViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   [self scale:self.imageVision angle:self.slider.value];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//旋转后,获得这个图片旋转的角度
-(void)getAngle{
    CGAffineTransform _trans = self.imageVision.transform;
    CGFloat rotate = acosf(_trans.a);
    // 旋转180度后，需要处理弧度的变化
    if (_trans.b < 0) {
        rotate = M_PI -rotate;
    }
    // 将弧度转换为角度
    CGFloat degree = rotate/M_PI * 180;
    NSLog(@"旋转角度%f",degree);
}

-(void)rotate:(UIImageView *)imageView angle:(CGFloat) aAngle{
//      CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*aAngle);
//    view.transform = CGAffineTransformScale(imageView.transform, 0.5, 0.5);

//    CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*aAngle);
//    imageView.transform = transform;//旋转
//    
//    [self scale:imageView angle:self.slider.value];
    
//    imageView.transform = CGAffineTransformRotate (imageView.transform, M_PI*aAngle);
//    imageView.transform = CGAffineTransformScale(imageView.transform, self.slider.value, self.slider.value);
    
//    imageView.transform = CGAffineTransformScale(imageView.transform, self.slider.value, self.slider.value);
    imageView.transform = CGAffineTransformRotate (imageView.transform, M_PI_2*aAngle);


}

-(void)scale:(UIImageView *)imageView angle:(CGFloat) aScale{
//    imageView.transform = CGAffineTransformMakeScale(aScale, aScale);
//    imageView.transform = CGAffineTransformScale(imageView.transform, aScale, aScale);
      imageView.transform = CGAffineTransformScale(imageView.transform, aScale, aScale);
    
//      imageView.transform = CGAffineTransformIdentity;
//     imageView.transform = CGAffineTransformScale(imageView.transform, 0.5, 0.5);
}

- (IBAction)next:(id)sender {
     [self scale:self.imageVision angle:0.8];
}


- (IBAction)priror:(id)sender {
    [self scale:self.imageVision angle:1.2];
}



- (IBAction)btnTopClick:(id)sender {
    if(self.direction==YSYDirectionUp){
       self.lblShow.text = @"上，正确";
    }else{
       self.lblShow.text = @"上,选择错误";
    }

}

- (IBAction)btnLeftClick:(id)sender {
    
    if(self.direction==YSYDirectionLeft){
        self.lblShow.text = @"选择左，正确";
    }else{
        self.lblShow.text = @"左,选择错误";
    }
//    [self rotate:self.imageVision angle:0.5];
//    [self getAngle];
}

- (IBAction)btnDownClick:(id)sender {
    
    if(self.direction==YSYDirectionDown){
        self.lblShow.text = @"选择下，正确";
    }else{
        self.lblShow.text = @"下,选择错误";
    }
//    [self rotate:self.imageVision angle:0.5];
//    [self getAngle];
}
- (IBAction)btnRightClick:(id)sender {
    if(self.direction==YSYDirectionRight){
        self.lblShow.text = @"选择右，正确";
    }else{
        self.lblShow.text = @"右,选择错误";
    }
}

- (IBAction)slide:(id)sender {
    UISlider * slider =  (UISlider *)sender;
    int progress = (int)lroundf(slider.value);
    NSLog(@"%i,%f",progress,slider.value);
//    [self scale:self.imageVision angle:slider.value];
}

- (IBAction)radomAngle:(id)sender {

   int angleNum =  [self getRandomNumber:0 to:3];
   NSLog(@"随机角度值为%i，上次值%i,累加%i,取模方向%i",angleNum,self.totalAngleValue,self.totalAngleValue+angleNum,(self.totalAngleValue+angleNum)%4);
    if(angleNum>0){
        self.totalAngleValue = (self.totalAngleValue+angleNum)%4;
    }

  
   NSLog(@"下个方向指向self.angleValue为%i",self.totalAngleValue);



   [self rotate:self.imageVision angle:angleNum];  //旋转角度
    
    
    self.direction = self.totalAngleValue;   //获得角度

    switch (self.direction) {
        case YSYDirectionUp:
            NSLog(@"上");
            break;
        case YSYDirectionLeft:
            NSLog(@"左");
            break;
        case YSYDirectionDown:
            NSLog(@"下");
            break;
        case YSYDirectionRight:
            NSLog(@"右");
            break;
            
        default:
            break;
    }
    
}
-(int)getRandomNumber:(int)from to:(int)to{
    return (int)(from + (arc4random() % (to-from+1)));

}



@end
