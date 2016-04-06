//
//  HZYUserItemModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYUserItemModel.h"

@implementation HZYUserItemModel

+(instancetype)userItemModelWithName:(NSString *)name urlstring:(NSString *)urlstring{
    
    HZYUserItemModel *model = [self userItemModelWithName:name];
    
    model.urlstring = urlstring;
    
    return model;
}

+(instancetype)userItemModelWithName:(NSString *)name{
    
    HZYUserItemModel *model = [[HZYUserItemModel alloc]init];
    
    model.name = name;
    
    return model;
    
}

+(instancetype)userItemModelWithName:(NSString *)name icon:(NSString *)icon{
    
    HZYUserItemModel *model = [self userItemModelWithName:name];
    
    model.icon = icon;
    
    return model;
    
}

+(instancetype)userItemModelWithName:(NSString *)name swich:(BOOL)swich{
    
    HZYUserItemModel *model = [self userItemModelWithName:name];
    
    model.swich = swich;
    
    return model;
    
}


@end
