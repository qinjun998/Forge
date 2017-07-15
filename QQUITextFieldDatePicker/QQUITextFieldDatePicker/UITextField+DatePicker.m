//
//  UITextField+DatePicker.m
//  QQUITextFieldDatePicker
//
//  Created by lee on 2017/7/15.
//  Copyright © 2017年 zzk. All rights reserved.
//


#import "UITextField+DatePicker.h"

@implementation UITextField (DatePicker)


+ (UIDatePicker *)sharedDatePicker;
{
    static UIDatePicker *daterPicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        daterPicker = [[UIDatePicker alloc] init];
        daterPicker.datePickerMode = UIDatePickerModeDate;
    });
    
    return daterPicker;
}


- (UIToolbar *)customAccessoryView{
    UIToolbar *customAccessoryView = nil;
    if(!customAccessoryView){
        customAccessoryView = [[UIToolbar alloc]initWithFrame:(CGRect){0,0,[UIScreen mainScreen].bounds.size.width,40}];
        customAccessoryView.barTintColor = [UIColor grayColor];
        UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *finish = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
        [customAccessoryView setItems:@[space,space,finish]];
    }
    return customAccessoryView;
}

- (void)doneClick:(id)sender{
    [self resignFirstResponder];
}

//
- (void)datePickerValueChanged:(UIDatePicker *)sender
{
    if (self.isFirstResponder)
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        self.text = [formatter stringFromDate:sender.date];
    }
}

// setter
- (void)setDatePickerInput:(BOOL)datePickerInput
{
    if (datePickerInput)
    {
        self.inputView = [UITextField sharedDatePicker];
        self.inputAccessoryView = [self customAccessoryView];

        [[UITextField sharedDatePicker] addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    else
    {
        self.inputView = nil;
        [[UITextField sharedDatePicker] removeTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

//getter
- (BOOL)datePickerInput
{
    return [self.inputView isKindOfClass:[UIDatePicker class]];
}




@end
