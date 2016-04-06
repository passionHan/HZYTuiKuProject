//
//  HZYWeeklyItemMoreStageController.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZYWeeklyItemMoreStageController : UITableViewController

@property (nonatomic ,assign) NSInteger type;

/**
 *  用于接受上一界面的点击的是section的名字
 */
@property (nonatomic ,copy) NSString *text;


@end
