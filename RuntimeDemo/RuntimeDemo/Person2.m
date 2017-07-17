//
//  Person2.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "Person2.h"
#import <objc/runtime.h>
#import "Bird.h"


@implementation Person2

/*
 2.备用接收者
 */

 - (id)forwardingTargetForSelector:(SEL)aSelector
 {
     NSLog(@"备用接收者");
 // 指定对某一个对象来执行方法
//     NSString *selName = NSStringFromSelector(aSelector);
//     if ([selName isEqualToString:@"fly"]) {
     
     if (aSelector==@selector(fly)) {
         return [Bird new];
     }
     return [super forwardingTargetForSelector:aSelector];;
 }

@end
