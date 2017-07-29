//
//  YSYRulerCell.h
//  ZZKong
//
//  Created by lee on 2017/7/25.
//  Copyright © 2017年 zzk. All rights reserved.
//

//#import "ECDTableViewCell.h"
//#import "ECDLinedTableCell.h"
#import "DYScrollRulerView.h"

@protocol YSYRulerCellDelegate <NSObject>
-(void) valueChanged:(float) value;
@end

@interface YSYRulerCell : UITableViewCell


@property(nonatomic, assign) CGRect rectFrame;
@property(nonatomic, copy)  NSString         *unit;//单位
@property(nonatomic, assign) float           stepNum;//分多少个区
@property(nonatomic, assign) float           minValue;//游标的最小值
@property(nonatomic, assign) float           maxValue;//游标的最大值
@property(nonatomic, assign) float           step;//间隔值，每两条相隔多少值
@property(nonatomic, assign) NSInteger       betweenNum;

@property(strong,nonatomic) DYScrollRulerView * rulerView;

@property(weak,nonatomic) id<YSYRulerCellDelegate>rulerDelegate;

-(void) updateWithCellData: (NSDictionary *) data indexPath:(NSIndexPath *)aIndex;

//初始化
-(void)initWithFrame:(CGRect)frame theMinValue:(float)minValue theMaxValue:(float)maxValue theStep:(float)step theUnit:(NSString *)unit theNum:(NSInteger)betweenNum;

@end
