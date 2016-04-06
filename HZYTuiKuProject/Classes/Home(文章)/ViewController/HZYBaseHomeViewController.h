//
//  HZYBaseHomeViewController.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HZYDetailViewController.h"

#import "HZYTitleModel.h"
#import "HZYTitleScrollView.h"
#import "HZYCollectionView.h"
#import "HZYCollectionViewCell.h"

@interface HZYBaseHomeViewController : UIViewController

@property (nonatomic,strong) NSArray *titleModelArray;

@property (nonatomic,strong) HZYTitleScrollView *titleScrollView;

@property (nonatomic,strong) HZYCollectionView *contentCollectionView;

@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

-(void)setUI;

@end
