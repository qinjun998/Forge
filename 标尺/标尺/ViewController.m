//
//  ViewController.m
//  标尺
//
//  Created by lee on 2017/7/30.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ViewController.h"
#import "DYScrollRulerView.h"

#define ScreenWidth  ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight  ([[UIScreen mainScreen] bounds].size.height)

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 \
alpha:1.0]



@interface ViewController ()<DYScrollRulerDelegate>

@property(nonatomic,strong)DYScrollRulerView *rullerView;
@property(nonatomic,strong)DYScrollRulerView *timeRullerView;

@end

@implementation ViewController


-(DYScrollRulerView *)rullerView{
    if (!_rullerView) {
        NSString *unitStr = @"";
        CGFloat rullerHeight = [DYScrollRulerView rulerViewHeight];  //固定高度
        _rullerView = [[DYScrollRulerView alloc]initWithFrame:CGRectMake(5, ScreenHeight/5.0, ScreenWidth-20, rullerHeight) theMinValue:0 theMaxValue:1000 theStep:10 theUnit:unitStr theNum:10];
        [_rullerView setDefaultValue:500 animated:YES];
        _rullerView.bgColor =UIColorFromRGB(0xf67259)  ;//尺子背后的颜色(背景色)
        _rullerView.triangleColor   = [UIColor redColor];
        _rullerView.delegate        = self;
        _rullerView.scrollByHand    = YES;
    }
    return _rullerView;
}


-(DYScrollRulerView *)timeRullerView{
    if (!_timeRullerView) {
        NSString *unitStr = @"";
        CGFloat rullerHeight = [DYScrollRulerView rulerViewHeight];
        _timeRullerView = [[DYScrollRulerView alloc]initWithFrame:CGRectMake(5, ScreenHeight/5.0*3, ScreenWidth-20, rullerHeight) theMinValue:0 theMaxValue:23  theStep:0.2 theUnit:unitStr theNum:5];
        [_timeRullerView setDefaultValue:2 animated:YES];
        _timeRullerView.bgColor = UIColorFromRGB(0xf67259) ;
        _timeRullerView.triangleColor   = [UIColor whiteColor];
        _timeRullerView.delegate        = self;
        _timeRullerView.scrollByHand    = YES;
    }
    return _timeRullerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.rullerView];
    [self.view addSubview:self.timeRullerView];
}


#pragma mark - YKScrollRulerDelegate
-(void)dyScrollRulerView:(DYScrollRulerView *)rulerView valueChange:(float)value{
    NSLog(@"value->%.f",value);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
