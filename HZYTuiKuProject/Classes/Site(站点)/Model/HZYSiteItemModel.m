//
//  HZYSiteItemModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/22.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYSiteItemModel.h"

@implementation HZYSiteItemModel


/**
 *  请求数据并解析
 */
+ (void)siteItemModelWithURLString:(NSString *)URLString sucessBlock:(sucessBlock)sucessBlock{
    
    [SVProgressHUD show];
    
    [HZYHttpRequest GET:URLString parameters:nil complete:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        
        if (!error) {
            
            [HZYSiteItemModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                
                return @{@"siteId":@"id"};
            }];
            
            //MJExtension字典数组转模型数组
            NSArray *num = [HZYSiteItemModel mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
            
            sucessBlock(num);
                
            [SVProgressHUD dismiss];

        }else{
            
            NSLog(@"%@",error);
        }
    }];
}

@end
