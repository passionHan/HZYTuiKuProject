//
//  HZYWeeklyItemStageDetatilController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemStageDetatilController.h"
#import "HZYWeeklyItemStageDetailModel.h"
#import "HZYWeeklyItemStageCategoryDetail.h"
#include "HZYStageCategoryDetailCell.h"
#import "HZYCategoryDetailFrameModel.h"
#import "HZYStageCategoryHeaderView.h"
#import "HZYDetailViewController.h"
//需要拼接周刊的type 和每一期的id
#define kStageDetailUrl @"http://api.tuicool.com/api/mag/detail.json?id=%@&type=%ld"
@interface HZYWeeklyItemStageDetatilController ()

/**
 *  装有HZYWeeklyItemStageDetailModel 模型的数组
 */
@property (nonatomic ,strong) NSArray *stageDetailArray;
/**
 *  用于显示界面的左侧标题
 */
@property (nonatomic ,strong) UILabel *viewTitle;

@end

@implementation HZYWeeklyItemStageDetatilController

- (NSArray *)stageDetailArray{
    
    if (_stageDetailArray == nil) {
        
        _stageDetailArray = [NSArray array];
    }
    
    return _stageDetailArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.sectionHeaderHeight = 40;
    
    //设置控制器只扩展底部
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    [self setNav];
    
    [self getData];

}

- (void)setNav{
    
    self.viewTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, 150, 44)];
    
    self.viewTitle.text = self.text;
    
    self.viewTitle.textColor = [UIColor whiteColor];
    
    [self.navigationController.view addSubview:self.viewTitle];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.viewTitle.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.viewTitle.hidden = YES;
}

- (void)getData{
    
    typeof (self) weakSelf = self;
    
    [HZYWeeklyItemStageDetailModel stageDetailRequestURL:[NSString stringWithFormat:kStageDetailUrl,self.stageId,self.type] success:^(NSArray *array) {
        
        weakSelf.stageDetailArray = array;
        
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {


    return self.stageDetailArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    HZYWeeklyItemStageDetailModel *model = self.stageDetailArray[section];

    return model.items.count;
}

/**
 *  tableView返回section的头视图
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HZYStageCategoryHeaderView *header = [HZYStageCategoryHeaderView headerViewWithTableView:tableView];

    header.detailModel = self.stageDetailArray[section];
    
    return header;
}

/**
 *  tableView返回cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYStageCategoryDetailCell *cell = [HZYStageCategoryDetailCell cellWithTableView:tableView];
    
    HZYWeeklyItemStageDetailModel *model = self.stageDetailArray[indexPath.section];
    
    cell.frameModel = model.items[indexPath.row];
       
    return cell;
}

/**
 *  tableView返回行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYWeeklyItemStageDetailModel *model = self.stageDetailArray[indexPath.section];
    
    HZYCategoryDetailFrameModel *frameModel = model.items[indexPath.row];
    
    return frameModel.cellHeight;
}

///**
// *  设置sectionView跟随tableView滚动
// */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYDetailViewController *detail = [[HZYDetailViewController alloc] init];
    
    HZYWeeklyItemStageDetailModel *model = self.stageDetailArray[indexPath.section];
    
    HZYCategoryDetailFrameModel *frameModel = model.items[indexPath.row];
    
    detail.detailTextId = frameModel.detailModel.url;
    
    [self.navigationController pushViewController:detail animated:YES];
    
}




@end
