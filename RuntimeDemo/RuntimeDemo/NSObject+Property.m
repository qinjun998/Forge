//
//  NSObject+Property.m
//  RuntimeDemo

//  向类别中添加属性

//  Created by lee on 2017/7/17.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>




static const char *key = "name";

@implementation NSObject (Property)

- (NSString *)name
{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, key);
}

/*
 OBJC_ASSOCIATION_ASSIGN;            //assign策略
 OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
 OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
 
 OBJC_ASSOCIATION_RETAIN;
 OBJC_ASSOCIATION_COPY;
 */

- (void)setName:(NSString *)name
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取   const void *key
    // 第三个参数：设置的value   id value
    // 第四个参数:关联的策略
//    objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
//    objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);

    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


//static char associatedObjectKey;
//objc_setAssociatedObject(target, &associatedObjectKey, @"添加的字符串属性", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//NSString *string = objc_getAssociatedObject(target, &associatedObjectKey);

- (void)addAssociatedObject:(id)object{
    
    objc_setAssociatedObject(self, @selector(getAssociatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)getAssociatedObject{
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
