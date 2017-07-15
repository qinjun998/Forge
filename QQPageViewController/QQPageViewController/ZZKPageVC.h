//
//  ZZKPageVC.h
//  ZZKong
//
//  Created by lee on 2017/7/15.
//  Copyright © 2017年 zzk. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ZZKPageVC : UIViewController

@property (nonatomic, strong) UICollectionView *selectItemView;  //选择项
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, assign) NSInteger currentIndex; //当前选中tab
@property (nonatomic, strong) NSMutableArray *contentVCs;  //所有tab控制的VC
@property (nonatomic, strong) NSMutableArray *tabTitles; //显示标题

@end
