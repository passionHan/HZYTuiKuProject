//
//  HZYWeeklyItemStageModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(NSArray *itemStageArray);
@interface HZYWeeklyItemStageModel : NSObject

/**
 *  期数的id
 */
@property (nonatomic ,copy) NSString *stageId;
/**
 *  所属的类型
 */
@property (nonatomic ,assign) NSInteger type;
/**
 *  是哪一期的
 */
@property (nonatomic ,copy) NSString *title;
/**
 *  时间
 */
@property (nonatomic ,copy) NSString *time;

+ (void)weeklyItmeStageRequestURL:(NSString *)urlString success:(successBlock)successBlock;

@end
