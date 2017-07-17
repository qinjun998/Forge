//
//  Person3.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "Person3.h"
#import <objc/runtime.h>
#import "Bird.h"


@implementation Person3

/**
 3.完整的消息转发
 */
// 我们首先要通过, 指定方法签名，若返回nil，则表示不处理。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"指定方法签名");
    NSString *selName = NSStringFromSelector(aSelector);
    if ([selName isEqualToString:@"fly"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 通过anInvocation对象做很多处理，比如修改实现方法，修改响应对象等
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"%s", __func__);
    // 改变响应对象
    //    [anInvocation invokeWithTarget:[SXTPig new]];
    // 改变响应方法
    //    [anInvocation setSelector:@selector(newTestMethod1)];
    
    // 改变响应对象并改变响应方法
    [anInvocation setSelector:@selector(fly)];
    [anInvocation invokeWithTarget:[Bird new]];
}


// 消息没发实现会调用这个方法
- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"哈哈哈哈：%@", NSStringFromSelector(aSelector));
}


@end
