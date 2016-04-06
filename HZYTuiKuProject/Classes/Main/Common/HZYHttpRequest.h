//
//  HZYHttpRequest.h
//  QinKerTravel
//
//  Created by passion on 16/3/19.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFHTTPRequestOperationManager.h>

typedef void (^CompleteBlock)(AFHTTPRequestOperation *operation , id responseObject, NSError *error);

@interface HZYHttpRequest : NSObject

/**
 *  GET请求方式
 */
+ (void)GET:(NSString *)URLString parameters:(NSDictionary *)para complete:(CompleteBlock)complete;
/**
 *  post请求方式
 *
 *  @param URLString 请求的URL
 *  @param parameter 传的参数
 *  @param complete  请求完成的block
 */
+ (void)POST:(NSString *)URLString parameter:(NSDictionary *)parameter complete:(CompleteBlock)complete;
@end
