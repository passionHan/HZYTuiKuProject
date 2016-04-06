//
//  HZYTitleScrollView.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTitleScrollViewItemsFontSize 17
#define kItemsPadding 25.0
#define kTitleScrollViewHeight 40

@class HZYTitleScrollView;
@protocol HZYTitleScrollViewDelegate <UIScrollViewDelegate>

/**
 *  titleScrollView上的item被点击的代理方法
 */
-(void)titleScrollView:(HZYTitleScrollView *)titleScrollView didSelectedItemIndex:(NSInteger)index;


@end
@interface HZYTitleScrollView : UIView

@property (nonatomic,weak) id<HZYTitleScrollViewDelegate>delegate;

/**
 *  装有titleModel的数组
 */
@property (nonatomic,strong) NSArray *titleModelArray;

/**
 *  tabBar当前选中的item的索引
 */
@property (nonatomic, assign) NSInteger currentItemIndex;


@end
