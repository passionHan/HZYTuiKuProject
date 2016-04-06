//
//  HZYWeeklyItemStageDetatilController.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZYWeeklyItemStageDetatilController : UITableViewController

/**
 *  用于接受上一界面传过来的周刊的type
 */
@property (nonatomic ,assign) NSInteger type;
/**
 * 用于接受上一界面传过来的不同周刊的期数的id
 */
@property (nonatomic ,copy) NSString *stageId;

@property (nonatomic ,copy) NSString *text;


@end
