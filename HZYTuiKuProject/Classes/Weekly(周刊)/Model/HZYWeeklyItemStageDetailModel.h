//
//  HZYWeeklyItemStageDetailModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(NSArray *array);

@interface HZYWeeklyItemStageDetailModel : NSObject

/**
 *  每一期内的分类名字
 */
@property (nonatomic ,copy) NSString *name;

/**
 *  装有每一期分类新闻简介的模型数组
 */
@property (nonatomic ,strong) NSArray *items;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  请求分类新闻简介的数据
 */
+ (void)stageDetailRequestURL:(NSString *)urlString success:(successBlock)success;

@end
