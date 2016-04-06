//
//  HZYTabBarController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/19.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYTabBarController.h"
#import "HZYNavigationController.h"
#import "Common.h"

#define InitChildVc(VcName,NormalImage,Title) \
[self addChildVc:[[VcName alloc] init] normalImage:NormalImage title:Title]

@interface HZYTabBarController ()

@end

@implementation HZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    InitChildVc(HZYHomeViewController, @"tab_home", @"文章");
    InitChildVc(HZYSiteViewController, @"tab_site", @"站点");
    InitChildVc(HZYTopicViewController, @"tab_topic", @"主题");
    InitChildVc(HZYWeeklyViewController, @"tab_dis", @"周刊");
    InitChildVc(HZYUserViewController, @"tab_user", @"我的");


}

- (void)addChildVc:(UIViewController *)childVc normalImage:(NSString *)normalImage title:(NSString *)title{
    
    
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:normalImage];

    HZYNavigationController *nav = [[HZYNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
}


@end
