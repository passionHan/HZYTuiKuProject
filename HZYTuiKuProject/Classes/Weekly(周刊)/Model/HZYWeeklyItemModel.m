//
//  HZYWeeklyItemModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemModel.h"
#import "HZYWeeklyItemStageModel.h"
@implementation HZYWeeklyItemModel

+ (void)weeklyItemRequestURL:(NSString *)urlString success:(successBlock)success{
    
    [HZYHttpRequest GET:urlString parameters:nil complete:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
       
        if (!error) {
            
            [HZYWeeklyItemStageModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                
                return @{@"stageId":@"id"};
            }];
            
            [HZYWeeklyItemModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                
                return @{@"weeklyItemStage":@"items"};
            }];
            
            [HZYWeeklyItemModel mj_setupObjectClassInArray:^NSDictionary *{
               
                return @{@"weeklyItemStage":[HZYWeeklyItemStageModel class]};
                
            }];
            
            NSArray *array = [HZYWeeklyItemModel mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
            
            success(array);
            
        }else{
            
            NSLog(@"error");
        }
        
    }];
}

@end
