//
//  HZYWeeklyItemStageCategoryDetail.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYWeeklyItemStageCategoryDetail : NSObject


@property (nonatomic ,copy) NSString *url;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *meta;

@property (nonatomic ,assign) NSInteger type;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
