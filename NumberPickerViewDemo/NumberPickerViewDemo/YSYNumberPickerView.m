//
//  YSYNumberPickerView.m
//  NumberPickerViewDemo
//
//  Created by lee on 2017/8/2.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "YSYNumberPickerView.h"




@interface YSYNumberPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate> {
    NSMutableArray *arr1,*arr2,*arr3,*arr4;
    NSMutableArray *_result;
}


@end

@implementation YSYNumberPickerView

//重写初始化方法
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
    }
    return self;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
    
}

-(void) initUI{
    arr1= [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6", @"7",@"8",@"9",nil];
    arr2= [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6", @"7",@"8",@"9",nil];
    arr3= [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6", @"7",@"8",@"9",nil];
    arr4= [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6", @"7",@"8",@"9",nil];
    
    _pickerDataSource = @[arr1,arr2,arr3,arr4];
    
    _result = [@[@"0", @"0", @"0", @"0"] mutableCopy];
    
    self.dataSource = self;
    self.delegate = self;
}

//http://www.cnblogs.com/ljlkfx/p/4845830.html
- (void)layoutSubviews{
    [super layoutSubviews];
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
       return [[_pickerDataSource objectAtIndex:component]objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _result[component] =  _pickerDataSource[component][row];
    self.resultValue = [self convert:_result];
}

-(NSInteger) convert:(NSMutableArray *) result{
    NSString *string = [NSString stringWithFormat:@"%@%@%@%@",result[0],result[1],result[2],result[3]];
    NSInteger num = [string integerValue];
    return num;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  [_pickerDataSource count];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
      return [_pickerDataSource[component] count];
}


//重新绘图
//- (void)drawRect:(CGRect)rect{}



@end
