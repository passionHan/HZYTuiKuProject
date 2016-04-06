//
//  HZYCollectionViewCell.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYCollectionViewCell.h"

#import "HZYContentTableViewController.h"
@interface HZYCollectionViewCell()

@property (nonatomic,strong) HZYContentTableViewController *ContentTableViewController;

@end
@implementation HZYCollectionViewCell

-(HZYContentTableViewController *)ContentTableViewController{
    
    if (_ContentTableViewController == nil) {
        _ContentTableViewController = [[HZYContentTableViewController alloc]init];
    }
    return _ContentTableViewController;
}

-(void)setUrlstring:(NSString *)urlstring{
    
    _urlstring = urlstring;
    
}

-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    self.ContentTableViewController.titlename = title;
    self.ContentTableViewController.urlstring = _urlstring;
    
    self.ContentTableViewController.tableView.frame = self.bounds;
    [self.contentView addSubview:self.ContentTableViewController.tableView];
}

@end
