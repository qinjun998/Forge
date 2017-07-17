//
//  Person1.m
//  RuntimeDemo
//
//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "Person1.h"
#import <objc/runtime.h>


@implementation Person1


//void nameSetter(id self, SEL cmd, id value){
//    NSString *fullName = value;
////    NSArray *nameArray = [fullName componentsSeparatedByString:@" "];
//    PersonModel *model = (PersonModel *)self;
//    
//    
////    model.firstName = nameArray[0];
////    model.lastName  = nameArray[1];
//}
//
//id nameGetter(id self, SEL cmd){
//    PersonModel *model = (PersonModel *)self;
//    NSMutableString *name = [[NSMutableString alloc] init];
//    if (nil != model.firstName) {
//        [name appendString:model.firstName];
//        [name appendString:@" "];
//    }
//    if (nil != model.lastName) {
//        [name appendString:model.lastName];
//    }
//    return name;
//}



//+ (BOOL)resolveClassMethod:(SEL)sel{
//    return YES;
//}

///**
// 1.方法的动态解析
// 对当前类添加一个方法
// */
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //    if(sel==@selector(testMethod)){
    // 指定对某一个方法的动态解析
    NSString *selName = NSStringFromSelector(sel);
        NSLog(@"方法的动态解析，%@",selName);
    if ([selName isEqualToString:@"fly"]) {
        // 动态的添加一个方法
//        class_addMethod([self class], @selector(newMethod), (IMP)newMethod, "v@:");
        class_addMethod([self class], sel, (IMP)newMethod, "v@:");
        return YES;
    }
    return NO;
}


//void newMethod(id self, SEL sel, id value) {
//void newMethod(id self,SEL _cmd){
void newMethod() {
    NSLog(@"执行新方法%s", __func__);
//    NSLog(@"执行新方法 %@ %s", self,sel_getName(sel));
}

// 消息没法实现会调用这个方法
- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"这下彻底没招了：%@", NSStringFromSelector(aSelector));
}


@end
