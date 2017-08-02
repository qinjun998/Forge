//
//  ViewController.m
//  NumberPickerViewDemo
//
//  Created by lee on 2017/8/2.
//  Copyright © 2017年 zzk. All rights reserved.
//


#import "ViewController.h"
#import "YSYNumberPickerView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YSYNumberPickerView *view = [[YSYNumberPickerView alloc]initWithFrame:CGRectMake(0, 44, 300, 150)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
