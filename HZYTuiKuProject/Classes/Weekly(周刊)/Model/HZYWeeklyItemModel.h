//
//  HZYWeeklyItemModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(NSArray *itemArray);
@interface HZYWeeklyItemModel : NSObject

/**
 *  周刊种类的名称
 */
@property (nonatomic ,copy) NSString *name;
/**
 *  类型编号
 */
@property (nonatomic ,assign) NSInteger type;

/**
 *  装有周刊期数的模型数组
 */
@property (nonatomic ,strong) NSArray *weeklyItemStage;

+ (void)weeklyItemRequestURL:(NSString *)urlString success:(successBlock)success;

@end
