//
//  ThirdViewController.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//http://www.cocoachina.com/ios/20150604/12013.html

#import "ThirdViewController.h"
#import <objc/runtime.h>
#import "Person1.h"
#import "Person2.h"
#import "Person3.h"
#import "Bird.h"



@interface ThirdViewController ()
- (IBAction)btnClick1:(id)sender;
- (IBAction)btnClick2:(id)sender;
- (IBAction)btnClick3:(id)sender;

@end

@implementation ThirdViewController


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    NSLog(@"Third viewDidAppear");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    unsigned int count = 0;
//    Class *classes = objc_copyClassList(&count);
//    for (int i = 0; i < count; i++) {
//        const char *cname = class_getName(classes[i]);
//        printf("%s\n", cname);
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClick1:(id)sender {
    Person1 *p1 = [Person1 new];
    [p1 performSelector:@selector(fly)];
}

- (IBAction)btnClick2:(id)sender {
    Person2 *p2 = [Person2 new];
    [p2 performSelector:@selector(fly)];
}

- (IBAction)btnClick3:(id)sender {
    Person3 *p3 = [Person3 new];
    [p3 performSelector:@selector(fly)];
}
@end
