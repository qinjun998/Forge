//
//  NSObject+Aspect.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "Person+Aspect.h"
#import <objc/runtime.h>


@implementation Person (Aspect)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod: @selector(speak)
                withMethod: @selector(aopMethod)];
    });
}

- (void)aopMethod{
    [self before];
    [self aopMethod];
    [self after];
}

- (void)before {
    NSLog(@"调用方法之前要做的事情");
}

- (void)after {
    NSLog(@"调用方法之后要做的事情");
}

- (void)swizzleMethod:(SEL)originSEL withMethod:(SEL)newSEL {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


@end
