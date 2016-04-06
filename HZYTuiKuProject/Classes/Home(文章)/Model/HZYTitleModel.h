//
//  HZYTitleModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYTitleModel : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *cid;

@property (nonatomic,copy) NSString *urlstring;

+(NSArray *)titleModelGetModelArrayWith:(NSString *)plistName;


@end
