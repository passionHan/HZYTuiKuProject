//
//  HZYSiteViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/22.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYSiteViewController.h"
#import "HZYSiteItemModel.h"
@interface HZYSiteViewController ()

@end

@implementation HZYSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //请求站点接口的数据
    [self getDataWithUrlString:kSiteURL];
    
    //拼接站点详情的URL,传递给父类
    self.newsUrlString = @"http://api.tuicool.com/api/sites/%@.json?size=30";
    
}

@end
