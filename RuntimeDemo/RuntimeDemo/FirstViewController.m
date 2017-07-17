//
//  FirstViewController.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "FirstViewController.h"
//#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>


@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidAppear:(BOOL)animated{
    
    
    [super viewDidAppear:animated];
    
    
    NSLog(@"Frist viewDidAppear");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    unsigned int count = 0;
    Class *classes = objc_copyClassList(&count);
    for (int i = 0; i < count; i++) {
        const char *cname = class_getName(classes[i]);
        printf("%s\n", cname);
    }
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
