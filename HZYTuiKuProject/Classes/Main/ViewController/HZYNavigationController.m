//
//  HZYNavigationController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/19.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYNavigationController.h"
#import "Common.h"

@interface HZYNavigationController ()< UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation HZYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置navigationBar字体的颜色
    [[self navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //设置导航条的颜色
    self.navigationBar.barTintColor = NavColor;
    
    //添加返回手势
    typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
    
}
//拦截所有要push进来的控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        
        //隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnDidClick)];
        viewController.navigationItem.leftBarButtonItem = backBtn;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backBtnDidClick{
    
    [self popViewControllerAnimated:YES];
}

@end
