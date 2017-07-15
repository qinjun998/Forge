//
//  ZZKPageVC.m
//  ZZKong
//
//  Created by lee on 2017/7/15.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ZZKPageVC.h"
#import "ZZKSelectTabItemCell.h"
#import <Masonry/Masonry.h>

@interface ZZKPageVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@end

@implementation ZZKPageVC
#pragma mark Properties
- (UICollectionView *)selectItemView{
    if (!_selectItemView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _selectItemView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _selectItemView.backgroundColor =[UIColor whiteColor];
        _selectItemView.dataSource = self;
        _selectItemView.delegate = self;
        _selectItemView.showsHorizontalScrollIndicator = NO;
        [_selectItemView registerClass:[ZZKSelectTabItemCell class] forCellWithReuseIdentifier:[ZZKSelectTabItemCell cellReuseIdentifier]];
    }
    return _selectItemView;
}

//获得pageViewController
- (UIPageViewController *)pageViewController
{
    if (_pageViewController == nil) {
        NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        _pageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        _pageViewController.view.backgroundColor = [UIColor clearColor];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
    }
    return _pageViewController;
}

- (NSMutableArray *)contentVCs{
    if (!_contentVCs) {
        _contentVCs = [NSMutableArray new];
    }
    return _contentVCs;
}


- (NSMutableArray *)tabTitles{
    if (!_tabTitles) {
        _tabTitles =  [NSMutableArray new];;
    }
    return _tabTitles;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.selectItemView];  //添加tab控件
    [self.view addSubview:self.pageViewController.view];  //添加pageViewController.view
    
    UIViewController *initialViewController =[self viewControllerAtIndex:0];// 得到第一页
    [self.pageViewController setViewControllers:@[initialViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    //默认选中第一个
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.selectItemView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    [self addChildViewController:self.pageViewController];
    
    
    
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    UINavigationBar *navBar = [keyWindow.rootViewController topestViewController].navigationController.navigationBar;
//    [keyWindow addSubview:self.wrapperView];
//    [self.wrapperView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(keyWindow);
//        make.top.equalTo(navBar.mas_bottom);
//    }];

    
    //设置布局
    [self.selectItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectItemView.mas_bottom);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Private Function 根据索引获得内容页

// 根据数组元素值，得到下标值
- (NSUInteger)indexOfViewController:(UIViewController *)viewController {
    return [self.contentVCs indexOfObject:viewController];
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    UIViewController *callVC = self.contentVCs[index];
    return callVC;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound || index >= (self.tabTitles.count - 1)) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}
//展示页指示器控件需要下面反反
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
//{
//    return [_contentVCs count];
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
//{
//    return 0;
//}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
    UIViewController *viewController = self.pageViewController.viewControllers[0];
    // Select tab
    NSUInteger index = [self indexOfViewController:viewController];
    if (index != _currentIndex) {
        _currentIndex = index;
        [self updateItemViewWithIndex:index];
    }
    
    return;
}

- (void)updateItemViewWithIndex:(NSUInteger )aIndex
{
    if (aIndex >= self.tabTitles.count) {
        return;
    }
    _currentIndex = aIndex;
    //使选中的item居中显示
    [self.selectItemView selectItemAtIndexPath:[NSIndexPath indexPathForRow:aIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

#pragma mark - UICollectionView DataSource & Delegate
//设置tab显示尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/self.tabTitles.count, 40);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tabTitles.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZKSelectTabItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ZZKSelectTabItemCell cellReuseIdentifier] forIndexPath:indexPath];
    [cell updateWithCellData:[self.tabTitles objectAtIndex:indexPath.row]];
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    用户点击后跳转到新页面
    [self dealSelectItemForRow:indexPath.row];
    
}

#pragma mark - 用户点击后跳转
- (void)dealSelectItemForRow:(NSInteger)aRow
{
    UIViewController *currentVC =  [self.contentVCs objectAtIndex:aRow];
    [self.pageViewController setViewControllers:@[currentVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
    }];
}



@end
