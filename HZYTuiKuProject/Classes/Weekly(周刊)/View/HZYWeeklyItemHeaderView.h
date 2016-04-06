//
//  HZYWeeklyItemHeaderView.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYWeeklyItemHeaderView;
@class HZYWeeklyItemModel;
@protocol HZYHeaderViewDelegate <NSObject>

@optional
- (void)headerViewDidClickMoreLabel:(HZYWeeklyItemHeaderView *)headerView viewForItemType:(NSInteger)type;

@end

@interface HZYWeeklyItemHeaderView : UITableViewHeaderFooterView

@property (nonatomic,weak) id<HZYHeaderViewDelegate>delegate;

@property (nonatomic ,strong) UILabel *weeklyItemLabel;

@property (nonatomic ,strong) HZYWeeklyItemModel *itemModel;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;


@end
