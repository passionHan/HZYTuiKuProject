//
//  HZYContentTableViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYContentTableViewController.h"
#import "HZYArticleModel.h"
#import "HZYNewsTableViewCell.h"
#import "HZYDetailViewController.h"
#import <Masonry.h>
@interface HZYContentTableViewController ()

@property (nonatomic,strong) NSMutableArray *articleModelArray;

@property (nonatomic,assign) BOOL islogin;

@end

@implementation HZYContentTableViewController

#pragma mark - 懒加载
-(NSMutableArray *)articleModelArray{
    
    if (_articleModelArray == nil) {
        _articleModelArray = [[NSMutableArray alloc]init];
    }
    return _articleModelArray;
}

#pragma mark - 视图生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.islogin = [HZYUserLoginModel sharedUserLoginModel].isLogin;
    
    self.tableView.rowHeight = 73;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        [self getData];
        [self.tableView.mj_header endRefreshing];
        
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        
        [self footGetData];
        [self.tableView.mj_footer endRefreshing];
        
    }];
    
    [self getNetWorkstate];
    
    [self getData];
    
}
-(void)getNetWorkstate{
    
    //声明一个监控网络的变化的单例类
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

        switch (status) {
            case AFNetworkReachabilityStatusUnknown: //未识别的网络

                break;
                
            case AFNetworkReachabilityStatusNotReachable:{ //网络未连接

                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"网络不正常" message:@"当前无网络" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:ac];
                [self presentViewController:alert animated:YES completion:nil];
                break;}
                
            case AFNetworkReachabilityStatusReachableViaWWAN: //数据连接（2,3,4G网络）

                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: //WiFi网络
                
                
                break;
            default:
                break;
        }
        
    }];
    //开始监控
    [manager startMonitoring];
}


-(void)footGetData{
    
    HZYArticleModel *lastModel = [self.articleModelArray lastObject];
    
    NSDictionary *par = [[NSDictionary alloc]init];
    if (lastModel) {
        
        par = @{
                @"last_id":lastModel.articleId,
                @"last_time":lastModel.uts
                };
        
    }
    
    if (!self.urlstring) {
        return;
    }
    
    __weak typeof(self) weakself = self;
    [HZYArticleModel articleModelGetDataWithURLString:self.urlstring title:self.titlename parameters:nil successblack:^(NSArray *modelArray) {
        
        [weakself.articleModelArray  addObjectsFromArray:modelArray];
        
        [weakself.tableView reloadData];
        
    }];
    
    
    
}

-(void)getData{
    
    __weak typeof(self) weakself = self;
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    //没有网络就加载缓存中的数据
    if (!manager.isReachable) {
        
        if ([self.titlename isEqualToString:@"热门"]) {
            
            [self.articleModelArray addObjectsFromArray:[HZYArticleTool Articalsback]];
            
            [self.tableView reloadData];
            
        }
        
    }else {
        
        if (!self.urlstring) {
            return;
        }
        //请求相应界面的数据
        [HZYArticleModel articleModelGetDataWithURLString:self.urlstring title:self.titlename parameters:nil successblack:^(NSArray *modelArray) {
            
            [weakself.articleModelArray removeAllObjects];
            [weakself.articleModelArray addObjectsFromArray:modelArray];
            
            [weakself.tableView reloadData];
            
        }];
    }
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.articleModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HZYArticleModel *model = self.articleModelArray[indexPath.row];
    
    NSInteger count = model.img.length;
    
    HZYNewsTableViewCell *cell = [HZYNewsTableViewCell cellWithTableView:tableView imageCount:count];
    
    cell.articleModel = model;
    
    return cell;
}

#pragma mark 按钮的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HZYArticleModel *model = self.articleModelArray[indexPath.row];
    
    //在主界面点击进入详情
    if (self.navigationController) {
        
        HZYDetailViewController *detail = [[HZYDetailViewController alloc]init];
        
        detail.detailTextId = model.articleId;
        
        [self.navigationController pushViewController:detail animated:YES];
        
        
    }else{
        
        //在其他界面进入详情使用通知
        [[NSNotificationCenter defaultCenter]postNotificationName:HZYPushToDetailTextVCNotification object:nil userInfo:@{HZYDetailTextIdKeyd:model.articleId}];
        
    }
    
}

@end
