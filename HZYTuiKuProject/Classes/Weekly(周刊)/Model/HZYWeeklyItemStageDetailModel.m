//
//  HZYWeeklyItemStageDetailModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemStageDetailModel.h"
#import "HZYWeeklyItemStageCategoryDetail.h"
#import "HZYCategoryDetailFrameModel.h"
@implementation HZYWeeklyItemStageDetailModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict1 in self.items) {
            
            HZYWeeklyItemStageCategoryDetail *detail = [HZYWeeklyItemStageCategoryDetail modelWithDict:dict1];
            
            HZYCategoryDetailFrameModel *frameModel = [[HZYCategoryDetailFrameModel alloc] init];
            
            frameModel.detailModel = detail;
            
            [array addObject:frameModel];
        }
        _items = array;
    }
    
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+ (void)stageDetailRequestURL:(NSString *)urlString success:(successBlock)success{
    
    [HZYHttpRequest GET:urlString parameters:nil complete:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        
        if (!error) {
            
            NSArray *rootArray = responseObject[@"items"];
            
            NSMutableArray *array = [NSMutableArray array];
            
            for (NSDictionary *dict in rootArray) {
                
                HZYWeeklyItemStageDetailModel *model = [HZYWeeklyItemStageDetailModel modelWithDict:dict];
                
                [array addObject:model];
            }
            
            success(array);
            
        }else{
            
            NSLog(@"%@",error);
        }
        
    }];
}

@end
