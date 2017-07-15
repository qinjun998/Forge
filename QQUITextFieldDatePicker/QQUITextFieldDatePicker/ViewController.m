//
//  ViewController.m
//  QQUITextFieldDatePicker
//
//  Created by lee on 2017/7/15.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+DatePicker.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *begin;

@property (weak, nonatomic) IBOutlet UITextField *end;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    self.begin.datePickerInput = YES;
    self.end.datePickerInput = YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
