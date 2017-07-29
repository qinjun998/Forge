//
//  YSYRulerCell.m
//  ZZKong
//
//  Created by lee on 2017/7/25.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "YSYRulerCell.h"


#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 \
alpha:1.0]


@interface YSYRulerCell ()<DYScrollRulerDelegate>

@end

@implementation YSYRulerCell

//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super initWithCoder:coder];
//    if (self) {
//        [self setupView];
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        [self setupView];
//    }
//    
//    return self;
//}



//初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}
//首先初始化所有参数
-(void)initWithFrame:(CGRect)frame theMinValue:(float)minValue theMaxValue:(float)maxValue theStep:(float)step theUnit:(NSString *)unit theNum:(NSInteger)betweenNum{
    self.rectFrame = frame;
    self.minValue = minValue;
    self.maxValue = maxValue;
    self.step = step;
    self.unit = unit;
    self.betweenNum = betweenNum;
}

-(void)setupView{
    [self.contentView addSubview:self.rulerView];
}

-(DYScrollRulerView *)rulerView{
    if (!_rulerView) {
        _rulerView = [[DYScrollRulerView alloc] initWithFrame:self.rectFrame theMinValue:self.minValue theMaxValue:self.maxValue theStep:self.step theUnit:self.unit theNum:self.betweenNum];
        [_rulerView setDefaultValue:(self.minValue+self.maxValue)/2 animated:YES];
        _rulerView.bgColor = UIColorFromRGB(0xf67259);//尺子背后的颜色(背景色)
        _rulerView.triangleColor   = [UIColor redColor];  //三角形颜色
        _rulerView.delegate        = self;
        _rulerView.scrollByHand    = YES;
    }
    return _rulerView;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self setupView];
}

#pragma mark - YKScrollRulerDelegate
-(void)dyScrollRulerView:(DYScrollRulerView *)rulerView valueChange:(float)value{
    if(self.rulerDelegate && [self.rulerDelegate respondsToSelector:@selector(valueChanged:)]){
        [self.rulerDelegate valueChanged:value]; // 通知执行协议方法
    }
}


-(void) updateWithCellData: (NSDictionary *) data indexPath:(NSIndexPath *)aIndex{
}

@end
