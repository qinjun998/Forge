//
//  SecondViewController.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "NSObject+Property.h"
#import "Person+Aspect.h"

@interface SecondViewController ()

- (IBAction)btnClick:(id)sender;


@end

@implementation SecondViewController


- (void)viewDidAppear:(BOOL)animated{
    
    
    [super viewDidAppear:animated];
    
    
    NSLog(@"Second viewDidAppear");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    Person  *person = [Person new];
    person.name = @"Hello World";
    NSLog(@"%@",person.name);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnClick:(id)sender {
    
    Person *p = [[Person alloc] init];
    //     调用对象方法
    [p speak];
}
@end
