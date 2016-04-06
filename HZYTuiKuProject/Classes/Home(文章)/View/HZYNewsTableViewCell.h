//
//  HZYNewsTableViewCell.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYArticleModel;

@interface HZYNewsTableViewCell : UITableViewCell

@property (nonatomic,strong) HZYArticleModel *articleModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView imageCount:(NSInteger)count;

@end
