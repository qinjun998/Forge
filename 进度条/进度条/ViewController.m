//
//  ViewController.m
//  进度条
//
//  Created by lee on 2017/7/27.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ViewController.h"

#import "MPSProgress.h"


@interface ViewController ()

@property(nonatomic,assign) CGFloat value;
@property(nonatomic,strong) MPSProgress  *progress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.value = 0.1;
    
    self.progress = [[MPSProgress alloc] initWithFrame:CGRectMake(0, 100, 300, 60)];
    
    
    self.progress.image = [UIImage imageNamed:@"resultTriangle"];
  // progress 范围：0～1
     [self.progress setProgress:self.value];
    
    [self.view addSubview:self.progress];
    
    
}


- (IBAction)btnClick:(id)sender {
    self.value += 0.2;
    [self.progress setProgress:self.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
