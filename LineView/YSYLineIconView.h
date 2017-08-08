//
//  YSYLineIconView.h
//  ZZKong
//
//  Created by lee on 2017/8/8.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YSYLineIconViewDelegete <NSObject>
- (void)lineIconCellClick:(NSIndexPath *)indexPath;
@end

@interface YSYLineIconView : UIView


@property (nonatomic, strong) UICollectionView *itemView;  //选择项

@property (nonatomic, strong) NSArray *imageNames; //固定不变的图片数据源
@property (nonatomic, strong) NSMutableArray *images; //图片不固定时的数据源


@property (nonatomic, weak) id<YSYLineIconViewDelegete> lineIconViewDelegete;

@end
