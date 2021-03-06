//
//  HZYArticleModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(NSArray *modelArray);

@interface HZYArticleModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *articleId;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,copy) NSString *rectime;

@property (nonatomic,copy) NSString *uts;

@property (nonatomic,copy) NSString *feed_title;

@property (nonatomic,copy) NSString *img;

/**
 *  请求指定标题的数据
 */
+(void)articleModelGetDataWithURLString:(NSString *)URLString title:(NSString *)title parameters:para successblack:(successBlock)successblock;


@end
