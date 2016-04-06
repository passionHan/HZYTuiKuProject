//
//  HZYUserGroupModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYUserGroupModel.h"

@implementation HZYUserGroupModel

+(instancetype)userGroupModelWithModelArray:(NSArray *)itemModelArray{
    
    HZYUserGroupModel *group = [[HZYUserGroupModel alloc]init];
    
    group.itemModelArray = itemModelArray;
    
    return group;
}

@end
