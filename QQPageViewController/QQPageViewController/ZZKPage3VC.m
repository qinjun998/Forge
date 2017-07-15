//
//  ZZKPage3VC.m
//  ZZKong
//
//  Created by lee on 2017/7/11.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ZZKPage3VC.h"
#import <Masonry/Masonry.h>

@interface ZZKPage3VC ()

@property(nonatomic,strong) UILabel  *titleLabel;

@end

@implementation ZZKPage3VC

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor blueColor];
    
    
    self.titleLabel  = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:10.f];
    self.titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.6];
    self.titleLabel.text = @"ZZKPage3VC";
    
    
    [self.view addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.titleLabel);
        make.centerY.equalTo(self.titleLabel);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
