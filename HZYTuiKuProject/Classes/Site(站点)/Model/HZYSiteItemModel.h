//
//  HZYSiteItemModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/22.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^sucessBlock)(NSArray *itemArray);

@interface HZYSiteItemModel : NSObject

@property (nonatomic,copy) NSString *siteId;

@property (nonatomic,copy) NSString *followed;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *image;

@property (nonatomic,copy) NSString *lang;

@property (nonatomic,copy) NSString *cover;

@property (nonatomic,assign) BOOL didSelected;

/**
 *  请求站点的数据
 *
 *  @param URLString   站点的URL
 *  @param sucessBlock 请求成功的回调
 */
+ (void)siteItemModelWithURLString:(NSString *)URLString sucessBlock:(sucessBlock)sucessBlock;

@end
