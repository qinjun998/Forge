//
//  DelViewController
//  滚动图片
//
//  Created by lee on 2017/8/8.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "DelViewController.h"
#import <Masonry/Masonry.h>
#import "View+MASAdditions.h"

#define IOS_VERSION_LOWER_THAN_8 (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)

#define SCREEN_WIDTH (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.height)


#define kScrollViewSize (self.scrollView.frame.size)

@interface DelViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *_views;
}


//轮播图
@property (strong, nonatomic)  UIScrollView *scrollView;
//页码
@property (strong, nonatomic) UIPageControl *pageControl;

//@property (strong, nonatomic) NSMutableArray *views;

@end

@implementation DelViewController




-(UIScrollView *) scrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] init];
//        _scrollView.scrollsToTop=YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.contentSize=CGSizeMake(SCREEN_WIDTH*5, 180);  //5个长度,高度180
        _scrollView.backgroundColor=[UIColor clearColor];
        _scrollView.pagingEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.delegate=self;
    }
    return _scrollView;
}


-(UIPageControl *) pageControl{
    if(!_pageControl){
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 150, 320, 30)]; //随意
        _pageControl.numberOfPages=5;
        _pageControl.currentPage=0;
//        _pageControl.tag=1001;
    }
    return _pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    
//    UIView* contentView = UIView.new;
//    
//    [self.scrollView addSubview:contentView];
//
//    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.scrollView);
//        make.width.equalTo(self.scrollView);
//    }];

    _views = [NSMutableArray new];
    for (int index=0; index<5; index++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(index*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"vision_%d.jpg",index+1]];
        [_views addObject:imageView];
    }

    UIView *lastView;
    for (UIView *view in _views) {
        [self.scrollView addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView == nil) {
                make.leading.equalTo(_scrollView.mas_leading);
                make.width.equalTo(self.view.mas_width);
                make.height.equalTo(_scrollView.mas_height);
            } else {
                make.leading.equalTo(lastView.mas_trailing);
                make.width.equalTo(lastView.mas_width);
                make.height.equalTo(lastView.mas_height);
            }
            
            if (lastView == _views.lastObject) {
                make.trailing.equalTo(_scrollView.mas_trailing);
            }
            make.top.equalTo(_scrollView.mas_top);
            make.bottom.equalTo(_scrollView.mas_bottom);
        }];
        
        lastView = view;
    }
    
//    for (int index=0; index<5; index++) {
//        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(index*320, 0, 320, 180)];
//        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"vision_%d.jpg",index+1]];
//        [self.scrollView addSubview:imageView];
//    }
//
//    [self.view addSubview:self.pageControl];

    
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    self.pageControl.currentPage = (self.scrollView.contentOffset.x + SCREEN_WIDTH * 0.5) / SCREEN_WIDTH;
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = (scrollView.contentOffset.x)/scrollView.frame.size.width;
    self.pageControl.currentPage = page;
    
}


@end
