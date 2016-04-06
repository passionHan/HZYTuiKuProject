//
//  HZYTopicViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/22.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYTopicViewController.h"

@interface HZYTopicViewController ()

@end

@implementation HZYTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getDataWithUrlString:kTopicURL];
    
    self.newsUrlString = @"http://api.tuicool.com/api/topics/%@.json?size=30";

}




@end
