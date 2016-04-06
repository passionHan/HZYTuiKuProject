//
//  HZYBaseHomeViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYBaseHomeViewController.h"
#define contentIdentifier @"contentCollectionViewIdentifier"

@interface HZYBaseHomeViewController ()<HZYTitleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic ,assign) NSInteger currentIndex;


@end

@implementation HZYBaseHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

}

-(NSArray *)titleModelArray{
    
    if (_titleModelArray == nil) {
        _titleModelArray = [[NSArray alloc]init];
        
    }
    return _titleModelArray;
}

-(HZYTitleScrollView *)titleScrollView{
    
    if (_titleScrollView == nil) {
        _titleScrollView = [[HZYTitleScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth,kTitleScrollViewHeight)];
        _titleScrollView.titleModelArray = self.titleModelArray;
        _titleScrollView.delegate = self;
    }
    
    return _titleScrollView;
}

-(UICollectionViewFlowLayout *)flowLayout{
    
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = self.contentCollectionView.bounds.size;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return  _flowLayout;
}

-(HZYCollectionView *)contentCollectionView{
    
    if (_contentCollectionView == nil) {
        _contentCollectionView = [[HZYCollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleScrollView.frame), kScreenWidth, kScreenheight-CGRectGetMaxY(self.titleScrollView.frame)-49) collectionViewLayout:self.flowLayout];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        _contentCollectionView.pagingEnabled = YES;

        for (int i = 0; i <self.titleModelArray.count; i ++) {
            [_contentCollectionView registerClass:[HZYCollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",contentIdentifier,i]];
        }
    }
    
    return _contentCollectionView;
}

#pragma mark - 设置子控件
-(void)setUI{
    
    [self.view addSubview:self.titleScrollView];
    
    [self.view addSubview:self.contentCollectionView];
    
}

#pragma mark - contentCollectionView的代理方法和数据源方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.titleModelArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",contentIdentifier,(int)indexPath.row] forIndexPath:indexPath];
    
    HZYTitleModel *model = self.titleModelArray[indexPath.row];
    
    cell.urlstring = model.urlstring;
    cell.title = model.title;

    return cell;
}

#pragma mark - titleScrollViewDelegate的代理方法

- (void)titleScrollView:(HZYTitleScrollView *)titleScrollView didSelectedItemIndex:(NSInteger)index{
    
    [self.contentCollectionView setContentOffset:CGPointMake(index * kScreenWidth, 0) animated:NO];
}

#pragma mark - 上下联动的实现

//手势导致的
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    self.titleScrollView.currentItemIndex = self.currentIndex;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.currentIndex = self.contentCollectionView.contentOffset.x / kScreenWidth + 0.5;
}



@end
