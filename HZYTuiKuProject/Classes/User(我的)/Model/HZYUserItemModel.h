//
//  HZYUserItemModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYUserItemModel : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *urlstring;

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,assign) BOOL swich;

+(instancetype)userItemModelWithName:(NSString *)name;

+(instancetype)userItemModelWithName:(NSString *)name urlstring:(NSString *)urlstring;

+(instancetype)userItemModelWithName:(NSString *)name icon:(NSString *)icon;

+(instancetype)userItemModelWithName:(NSString *)name swich:(BOOL)swich;


@end
