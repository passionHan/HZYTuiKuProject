//
//  HZYUserLoginCell.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYUserItemModel;

@interface HZYUserLoginCell : UITableViewCell

@property (nonatomic,strong) HZYUserItemModel *itemModel;

+(instancetype)userLoginCell;

@end
