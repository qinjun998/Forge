//
//  YSYLineIconView.m
//  ZZKong
//
//  Created by lee on 2017/8/8.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "YSYLineIconView.h"
#import "YSYImageButtonView.h"   
#import "ECDCollectionViewCell.h"




@interface LineIconImageButtonViewCell : ECDCollectionViewCell
   @property (nonatomic, strong) UIButton *imageButton;
@end

@implementation LineIconImageButtonViewCell

-(UIButton *)imageButton{
    if(!_imageButton){
        _imageButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _imageButton.userInteractionEnabled = NO;
    }
    return _imageButton;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self.contentView addSubview:self.imageButton];
        [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.trailing.bottom.leading.equalTo(self);
        }];
    }
    return self;
}


- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *source = (NSMutableArray *)aData;
    [self.imageButton setImage:source[indexPath.row] forState:UIControlStateNormal];
}

@end




@interface YSYLineIconView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end




@implementation YSYLineIconView

#pragma mark Properties
- (NSMutableArray *)images{
    if(!_images){
        _images = [NSMutableArray array];
        for(int i=0;i<self.imageNames.count ;i++){
            [_images addObject:[UIImage imageNamed:self.imageNames[i]]];
        }
    }
    return _images;
}

- (UICollectionView *)itemView{
    if (!_itemView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _itemView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        //layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        _itemView.backgroundColor =[UIColor whiteColor];  //背景设置
        _itemView.dataSource = self;
        _itemView.delegate = self;
        _itemView.showsHorizontalScrollIndicator = NO;
        [_itemView registerClass:[LineIconImageButtonViewCell class] forCellWithReuseIdentifier:[LineIconImageButtonViewCell cellReuseIdentifier]];
    }
    return _itemView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}


- (void)_init{
    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.itemView];
    [self.itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.leading.equalTo(self);
    }];
}


#pragma mark UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LineIconImageButtonViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[LineIconImageButtonViewCell cellReuseIdentifier] forIndexPath:indexPath];
    [cell updateWithCellData:self.images atIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.lineIconViewDelegete && [self.lineIconViewDelegete respondsToSelector:@selector(lineIconCellClick:)]) {
        [self.lineIconViewDelegete lineIconCellClick:indexPath];
    }
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return collectionView.bounds.size;
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(40, 40);
}


- (void)reloadData{
    [self.itemView reloadData] ;
}



@end
