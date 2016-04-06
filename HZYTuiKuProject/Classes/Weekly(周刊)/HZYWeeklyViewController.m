//
//  HZYWeeklyViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyViewController.h"
#import "HZYWeeklyItemModel.h"
#import "HZYWeeklyItemStageModel.h"
#import "HZYWeeklyItemHeaderView.h"
#import "HZYWeeklyItemCell.h"
#import "HZYWeeklyItemMoreStageController.h"
#import "HZYWeeklyItemStageDetatilController.h"
@interface HZYWeeklyViewController ()<UITableViewDelegate,UITableViewDataSource,HZYHeaderViewDelegate>

@property (nonatomic ,strong) NSArray *weeklyItemArray;

@end

@implementation HZYWeeklyViewController

- (NSArray *)weeklyItemArray{
    
    if (_weeklyItemArray == nil) {
        
        _weeklyItemArray = [NSMutableArray array];
    }
    
    return _weeklyItemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置扩展底部区域(不设置导航栏会盖住一部分tableView)如果设置为None的话tabbar会变暗
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    [self setNav];
    [self getData];
    
}

/**
 *  设置导航栏
 */
-(void)setNav{
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_setting"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtn)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationItem.leftBarButtonItem = nil;
    
}

- (void)settingBtn{
    
    
}

- (void)getData{
    
    typeof(self) weakSelf = self;
    [HZYWeeklyItemModel weeklyItemRequestURL:kWeeklyItemUrl success:^(NSArray *itemArray) {
        
        weakSelf.weeklyItemArray = itemArray;
        
        [weakSelf.tableView reloadData];
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.weeklyItemArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.weeklyItemArray[section] weeklyItemStage].count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HZYWeeklyItemHeaderView *view = [HZYWeeklyItemHeaderView headerViewWithTableView:tableView];

    view.delegate = self;
    
    view.itemModel = self.weeklyItemArray[section];
    
    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //创建cell
    HZYWeeklyItemCell *cell = [HZYWeeklyItemCell cellWithTableView:tableView];
    
    HZYWeeklyItemModel *itemModel = self.weeklyItemArray[indexPath.section];
    
    //传递模型数据
    cell.stageModel = itemModel.weeklyItemStage[indexPath.row];

    return cell;
}

/**
 *  tableView行点击事件,跳转到每一期的详情界面
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYWeeklyItemStageDetatilController *detail = [[HZYWeeklyItemStageDetatilController alloc] init];
    
    HZYWeeklyItemModel *itemModel = self.weeklyItemArray[indexPath.section];
    
    HZYWeeklyItemStageModel *stageModel = itemModel.weeklyItemStage[indexPath.row];

    detail.type = itemModel.type;
    
    detail.text = [NSString stringWithFormat:@"%@-%@",itemModel.name,stageModel.title];
    
    detail.stageId = stageModel.stageId;
    
    [self.navigationController pushViewController:detail animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

/**
 *  设置sectionView跟随tableView滚动
 */
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

#pragma mark -- HZYHeaderView 代理方法

- (void)headerViewDidClickMoreLabel:(HZYWeeklyItemHeaderView *)headerView viewForItemType:(NSInteger)type{
    
    
    HZYWeeklyItemMoreStageController *more = [[HZYWeeklyItemMoreStageController alloc] init];
    
    more.type = type;
    
    more.text = headerView.weeklyItemLabel.text;
    
    [self.navigationController pushViewController:more animated:YES];
}


@end
