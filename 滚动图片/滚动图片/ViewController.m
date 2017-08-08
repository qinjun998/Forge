//
//  ViewController.m
//  滚动图片
//
//  Created by lee on 2017/8/8.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ViewController.h"
#import "BannerView.h"

#import <Masonry/Masonry.h>
#import "View+MASAdditions.h"

#define IOS_VERSION_LOWER_THAN_8 (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)

#define SCREEN_WIDTH (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.height)


@interface ViewController ()

@property(nonatomic,strong) BannerView *bannerView;


@end

@implementation ViewController

-(BannerView *)bannerView{
    if(!_bannerView){
        NSArray *imgArr = @[@"vision_1",@"vision_2",@"vision_3",@"vision_4",@"vision_5"];
        _bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 200) WithImageArray:imgArr];
    }
    return  _bannerView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)shang:(id)sender {
    
    [self.bannerView priorPage];
}

- (IBAction)xia:(id)sender {
    [self.bannerView nextPage];
}

@end
