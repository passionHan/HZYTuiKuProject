//
//  HZYTitleModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYTitleModel.h"

@implementation HZYTitleModel

/**
 *  获得plist文件中的数据转成模型
 */
+(NSArray *)titleModelGetModelArrayWith:(NSString *)plistName{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    
    return [self mj_objectArrayWithKeyValuesArray:plistArray];
}


@end
