//
//  HZYWeeklyItemStageModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemStageModel.h"

@implementation HZYWeeklyItemStageModel

+ (void)weeklyItmeStageRequestURL:(NSString *)urlString success:(successBlock)successBlock{
    
    [HZYHttpRequest GET:urlString parameters:nil complete:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
       
        if (!error) {
        
            [HZYWeeklyItemStageModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
               
                return @{@"stageId":@"id"};
                
            }];
    
            
            NSArray *array = [HZYWeeklyItemStageModel mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
            
            successBlock(array);
            
        }else{
            
            NSLog(@"%@",error);
        }
        
    }];
}

- (NSString *)time{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[_time longLongValue] / 1000];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    [fmt setDateFormat:@"MM月d日"];
    
    NSString *dateString = [fmt stringFromDate:date];
    
    if ([dateString hasPrefix:@"0"]) {
        
        dateString = [dateString substringFromIndex:1];
    }

    return dateString;
}

@end
