//
//  HZYUserGroupModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYUserGroupModel : NSObject

@property (nonatomic,strong) NSArray *itemModelArray;

+(instancetype)userGroupModelWithModelArray:(NSArray *)itemModelArray;


@end
