//
//  HZYWeeklyItemCell.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYWeeklyItemStageModel;
@interface HZYWeeklyItemCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic ,strong) HZYWeeklyItemStageModel *stageModel;


@end
