//
//  AppDelegate.m
//  滚动图片
//
//  Created by lee on 2017/8/8.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "BannerView.h"


#define IOS_VERSION_LOWER_THAN_8 (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)

#define SCREEN_WIDTH (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.height)


@interface BannerView()<UIScrollViewDelegate>

@end

@implementation BannerView

-(instancetype)initWithFrame:(CGRect)frame WithImageArray:(NSArray *)imageArr{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupScrollView];
        [self setupPageControl];
        [self setupDataWithArray:imageArr];
    }
    return self;
}

-(void)setupScrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
//        _scrollView.scrollEnabled = NO;
        [self addSubview:_scrollView];
    }
}

-(void)setupPageControl{
    if(!_pageControl){
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        _pageControl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - 10);
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.hidden = YES;
        [self addSubview:_pageControl];
    }
}

-(void)setupDataWithArray:(NSArray *)imgArr{
    // 设置图片
    for (int i=0; i < imgArr.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgArr[i]]];
        imgView.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        [_scrollView addSubview:imgView];
    }
    _scrollView.contentSize = CGSizeMake(imgArr.count * self.frame.size.width, self.frame.size.height);
    _pageControl.numberOfPages = imgArr.count;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x / self.frame.size.width;
}



#pragma mark -  scrollView Delegate
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    CGFloat pageWidth = scrollView.frame.size.width;
//    NSInteger page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.tabSelect.selectedIndex = page;
//    
//}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat offset = (scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.size.width)) * (_tabSelect.buttonWidth * (_tabSelect.tabCount - 1));
//    [_tabSelect setIndicatorLeadingOffset:offset];
//    
//}

-(void)nextPage{
    self.scrollView.contentOffset = CGPointMake(self.frame.size.width*(_pageControl.currentPage+1), 0.0);
    _pageControl.currentPage = _pageControl.currentPage+1;
}
-(void)priorPage{
    self.scrollView.contentOffset = CGPointMake(self.frame.size.width*(_pageControl.currentPage-1), 0.0);
    _pageControl.currentPage = _pageControl.currentPage-1;
}


@end
