//
//  HZYStageCategoryHeaderView.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYWeeklyItemStageDetailModel;
@interface HZYStageCategoryHeaderView : UITableViewHeaderFooterView


@property (nonatomic ,strong) HZYWeeklyItemStageDetailModel *detailModel;


+ (instancetype)headerViewWithTableView:(UITableView *)tableView;


@end
