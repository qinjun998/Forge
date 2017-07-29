//
//  ZZKMyTaskListVC.m
//  ZZKong
//
//  Created by lee on 2017/7/14.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZKMyTaskListVC.h"
//#import "UICollectionView.h"
#import "ZZKSelectTabItemCell.h"


#import "ZZKPage1VC.h"
#import "ZZKPage2VC.h"
#import "ZZKPage3VC.h"



@interface ZZKMyTaskListVC ()

@end

@implementation ZZKMyTaskListVC

#pragma mark Properties

//- (NSMutableArray *)contentVCs{
//    NSMutableArray * _contentVCs =  [super contentVCs];
//    
//    ZZKPage1VC *vc1 = [ZZKPage1VC new];
//    ZZKPage2VC *vc2 = [ZZKPage2VC new];
//    ZZKPage3VC *vc3 = [ZZKPage3VC new];
//    
//    [_contentVCs addObject:vc1];
//    [_contentVCs addObject:vc2];
//    [_contentVCs addObject:vc3];
//    
//    return _contentVCs;
//}
//
//- (NSMutableArray *)tabTitles{
//    NSMutableArray * _tabTitles =  [super tabTitles];
//    _tabTitles =[@[@"参与",@"发布",@"收藏"] mutableCopy];
//    return _tabTitles;
//}


- (void)viewDidLoad {
    
    self.title = @"颐寿文摘";
    
    self.tabTitles =  [@[@"参与",@"发布",@"收藏"] mutableCopy];

    ZZKPage1VC *vc1 = [ZZKPage1VC new];
    ZZKPage2VC *vc2 = [ZZKPage2VC new];
    ZZKPage3VC *vc3 = [ZZKPage3VC new];
    

    
    [self.contentVCs addObject:vc1];
    [self.contentVCs addObject:vc2];
    [self.contentVCs addObject:vc3];

    [super viewDidLoad];
    

    
 
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 切换显示模式
- (void)changeShowModel {

}


-(void)initUI{
    [self initNavigationBar];
    [self initMainView];
}


-(void)initNavigationBar{

    self.title = @"我的任务";
}

-(void)initMainView{

    
}




@end
