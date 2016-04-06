//
//  HZYWeeklyItemMoreStageController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemMoreStageController.h"
#import "HZYWeeklyItemStageModel.h"
#import "HZYWeeklyItemCell.h"
#import "HZYWeeklyItemStageDetatilController.h"

#define kWeeklyItemStageUrl @"http://api.tuicool.com/api/mag/period_list.json?type=%ld"

@interface HZYWeeklyItemMoreStageController ()

/**
 *  装有HZYWeeklyItemStageModel 模型的数组
 */
@property (nonatomic ,strong) NSMutableArray *itemStageArray;

@property (nonatomic ,strong) UILabel *viewTitle;


@end

@implementation HZYWeeklyItemMoreStageController

/**
 *  模型数组懒加载
 */
- (NSMutableArray *)itemStageArray{
    
    if (_itemStageArray == nil) {
        
        _itemStageArray = [NSMutableArray array];
    }
    
    return _itemStageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    typeof(self) weakself = self;
    [HZYWeeklyItemStageModel weeklyItmeStageRequestURL:[NSString stringWithFormat:kWeeklyItemStageUrl,self.type] success:^(NSArray *itemStageArray) {
        
        [weakself.itemStageArray removeAllObjects];
        [weakself.itemStageArray addObjectsFromArray:itemStageArray];
        
        [weakself.tableView reloadData];
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.itemStageArray.count;
    
}
/**
 *  返回cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYWeeklyItemCell *cell = [HZYWeeklyItemCell cellWithTableView:tableView];
    
    cell.stageModel = self.itemStageArray[indexPath.row];

    return cell;
}

/**
 *  点击行事件调到周刊期数详情界面
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYWeeklyItemStageModel *stageModel = self.itemStageArray[indexPath.row];
    
    HZYWeeklyItemStageDetatilController *detail = [[HZYWeeklyItemStageDetatilController alloc] init];
    
    detail.type = self.type;
    
    detail.stageId = stageModel.stageId;
    
    detail.text = [NSString stringWithFormat:@"%@-%@",self.text,stageModel.title];
    
    [self.navigationController pushViewController:detail animated:YES];
}

@end
