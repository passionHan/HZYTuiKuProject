//
//  HZYArticleTool.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HZYArticleModel;
@interface HZYArticleTool : NSObject

/**
*  删除一个模型
*/
+(void)deleteArticalWithModel:(HZYArticleModel *)model;
/**
 *  添加一个模型
 */
+ (void)addArticalWithModel:(HZYArticleModel *)model;
/**
 *  添加一组数据
 */
+ (void)addArticalWithArray:(NSArray *)modelArray;
/**
 *  获取全部数据
 */
+ (NSArray *)Articalsback;



@end
