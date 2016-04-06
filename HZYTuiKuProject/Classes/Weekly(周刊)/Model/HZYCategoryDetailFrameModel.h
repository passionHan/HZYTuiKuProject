//
//  HZYCategoryDetailFrameModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HZYWeeklyCateforyDetailFont [UIFont systemFontOfSize:14]
@class HZYWeeklyItemStageCategoryDetail;

@interface HZYCategoryDetailFrameModel : NSObject

/**
 *  标题的frame
 */
@property (nonatomic ,assign,readonly) CGRect titleF;

/**
 *  cell的高度
 */
@property (nonatomic ,assign,readonly) CGFloat cellHeight;

/**
 *  数据模型
 */
@property (nonatomic ,strong) HZYWeeklyItemStageCategoryDetail *detailModel;



@end
