//
//  HZYSearchViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYSearchViewController.h"

@interface HZYSearchViewController ()

@end

@implementation HZYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleModelArray = [HZYTitleModel titleModelGetModelArrayWith:@"search.plist"];
    
    [self setUI];
    
    [self setNav];
    
}

-(void)setNav{
    
    UISearchBar *search = [[UISearchBar alloc]init];
    search.placeholder = @"请输入搜索";
    self.navigationItem.titleView = search;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    
    
    self.navigationItem.leftBarButtonItems = @[back];
    
    
    
}

-(void)backBtnClick{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
