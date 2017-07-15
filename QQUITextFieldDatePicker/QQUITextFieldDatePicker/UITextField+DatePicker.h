//
//  UITextField+DatePicker.h
//  QQUITextFieldDatePicker
//
//  Created by lee on 2017/7/15.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DatePicker)

@property (nonatomic, assign) BOOL datePickerInput;

+ (UIDatePicker *)sharedDatePicker;

@end
