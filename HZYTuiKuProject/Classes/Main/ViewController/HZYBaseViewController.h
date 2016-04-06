//
//  HZYBaseViewController.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/19.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZYSiteItemModel.h"
#import "HZYContentTableViewController.h"
#import "HZYSiteItemTableViewCell.h"

@interface HZYBaseViewController : UITableViewController

@property (nonatomic ,assign,getter=isLogin) BOOL login;

@property (nonatomic ,strong) NSArray *itemModelArray;

@property (nonatomic ,strong) UIButton *footView;

@property (nonatomic ,copy) NSString *newsUrlString;


-(void)getDataWithUrlString:(NSString *)urlString;

@end
