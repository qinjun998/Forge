//
//  CIPSelectModelYearCVCell.m
//  DymIOSApp
//
//  Created by Roy on 16/3/22.
//  Copyright © 2016年 JiaParts. All rights reserved.
//

#import "ZZKSelectTabItemCell.h"
#import "ALView+PureLayout.h"

@interface ZZKSelectTabItemCell ()

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UILabel *nameLabel;

@end


@implementation ZZKSelectTabItemCell

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}


- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor redColor];
        _bottomLine.hidden = YES;
    }
    return _bottomLine;
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}



- (void)initUI{
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.bottomLine];
    
    [self.nameLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 3, 0)];
    [self.bottomLine autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(38, 0, 0, 0)];

}


- (void)updateWithCellData:(id)aData{
    if ([aData isKindOfClass:[NSString class]]) {
        self.nameLabel.text = aData;

    }else if ([aData isKindOfClass:[NSNumber class]]){
        NSNumber *yearNumber = aData;
        self.nameLabel.text = yearNumber.stringValue;
    }else{
        self.nameLabel.text = @"";
    }
    
}


- (void)setSelected:(BOOL)selected{
    self.bottomLine.hidden = !selected;
}

@end
