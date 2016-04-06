//
//  HZYBaseViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/19.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYBaseViewController.h"

@interface HZYBaseViewController ()

@end

@implementation HZYBaseViewController

-(NSArray *)itemModelArray{
    
    if (_itemModelArray == nil) {
        _itemModelArray = [[NSArray alloc]init];
    }
    return _itemModelArray;
    
}


-(UIButton *)footView{
    
    if (_footView == nil) {
        
        _footView = [[UIButton alloc]init];
        
        _footView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        
        [_footView setTitle:@"+ 订阅更多站点" forState:UIControlStateNormal];
        
        _footView.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_footView setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [_footView addTarget:self action:@selector(moreSiteClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _footView;
}
/**
 *  点击订阅更多站点
 */
-(void)moreSiteClick{
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.rowHeight = 44;
    
    [self setNav];
    
}


#pragma mark - 设置导航栏
/**
 *  设置导航栏
 */
-(void)setNav{
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more1"] style:UIBarButtonItemStylePlain target:self action:@selector(moreBtn)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationItem.leftBarButtonItem = nil;
    
}

#pragma mark 导航栏更多(右侧)按钮
/**
 *  导航栏更多(右侧)按钮
 */
-(void)moreBtn{
    
}

#pragma mark 获取数据
/**
 *  根据URL获取数据
 */
-(void)getDataWithUrlString:(NSString *)urlString{
    
    __weak typeof(self) weakself = self;
    
    [HZYSiteItemModel siteItemModelWithURLString:urlString  sucessBlock:^(NSArray *itemArray) {
        
        weakself.itemModelArray = itemArray;
        [weakself.tableView reloadData];
        weakself.tableView.tableFooterView = weakself.footView;
        
    }];    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.itemModelArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建cell
    HZYSiteItemTableViewCell *cell = [HZYSiteItemTableViewCell cellWithTableView:tableView];
    
    //传递模型数据
    cell.siteItemModel = self.itemModelArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYSiteItemModel *model = self.itemModelArray[indexPath.row];
    
    model.didSelected = YES;
    //model.count = @"";
    HZYContentTableViewController *contentVc = [[HZYContentTableViewController alloc]init];
    
    contentVc.title = model.name;
    
    //拼接接口
    NSString *urlstring = [NSString stringWithFormat:self.newsUrlString,model.siteId];
    
    contentVc.urlstring = urlstring;
    
    [self.navigationController pushViewController:contentVc animated:YES];
}

@end
