//
//  HZYDetailModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/21.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYDetailModel.h"
#import "HZYImageModel.h"

@implementation HZYDetailModel

/**
 *  请求详情页面的数据 字典装模型
 *
 *  @param detailTextId 文章的id
 */
+(void)detileNewsModelGetWithdetailTextId:(NSString *)detailTextId success:(successBlock)successback{
    
    NSString *urlstring = [NSString stringWithFormat:kDetatilURL,detailTextId];
    
    [HZYHttpRequest GET:urlstring parameters:nil complete:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        
        if (!error) {
            
            //替换字典中的关键字
            [HZYImageModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                
                return @{@"image_id":@"id"};
            }];
            
            [HZYDetailModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                
                return @{@"detatilArticleId":@"id"};
            }];
            
            //HZYDetailModel images属性里面要装的模型类
            [HZYDetailModel mj_setupObjectClassInArray:^NSDictionary *{
                
                return @{@"images":@"HZYImageModel"};
                                  //[HZYImageModel class]
                
            }];
            
            HZYDetailModel *model = [HZYDetailModel mj_objectWithKeyValues:responseObject[@"article"]];

            successback(model);

        }
    }];
}


@end
