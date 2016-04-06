//
//  HZYSiteItemTableViewCell.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/22.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYSiteItemModel;
@interface HZYSiteItemTableViewCell : UITableViewCell

@property (nonatomic ,strong) HZYSiteItemModel *siteItemModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
