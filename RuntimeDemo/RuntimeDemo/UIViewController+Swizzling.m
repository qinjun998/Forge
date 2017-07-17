//
//  UIViewController+Swizzling.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)


+ (void)load
{
    SEL origSel = @selector(viewDidAppear:);
    SEL swizSel = @selector(swiz_viewDidAppear:);
    [UIViewController swizzleMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];
}

//exchange implementation of two methods
+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel
{
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
    
    //class_addMethod will fail if original method already exists
     //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    //如果成功，说明类中不存在这个方法的实现
    //将被交换方法的实现替换到这个并不存在的实现

    if (didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        //origMethod and swizMethod already exist  存在这个方法则交换两个方法的实现
        method_exchangeImplementations(origMethod, swizMethod);
    }
}

- (void)swiz_viewDidAppear:(BOOL)animated
{
    NSLog(@"I am in - [swiz_viewDidAppear:]");

    //需要注入的代码写在此处

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"替换" style:UIBarButtonItemStylePlain target:nil action:nil];

    
//    [self.navigationItem setHidesBackButton:TRUE animated:NO];
    
    [self swiz_viewDidAppear:animated];
}

@end
