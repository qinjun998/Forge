//
//  YSYNumberPickerView.h
//  NumberPickerViewDemo
//
//  Created by lee on 2017/8/2.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface YSYNumberPickerView : UIPickerView

@property(nonatomic,assign) NSInteger resultValue;

@property(nonatomic,strong) NSArray  *pickerDataSource;



@end
