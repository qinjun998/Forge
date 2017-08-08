//
//  AppDelegate.m
//  滚动图片
//
//  Created by lee on 2017/8/8.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView : UIView

@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIPageControl * pageControl;

-(instancetype)initWithFrame:(CGRect)frame WithImageArray:(NSArray *)imageArr;


-(void)nextPage;
-(void)priorPage;

@end
