//
//  HZYStageCategoryDetailCell.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYCategoryDetailFrameModel;

@interface HZYStageCategoryDetailCell : UITableViewCell

@property (nonatomic ,strong) HZYCategoryDetailFrameModel *frameModel;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
