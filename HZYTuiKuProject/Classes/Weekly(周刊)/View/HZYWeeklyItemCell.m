//
//  HZYWeeklyItemCell.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemCell.h"
#import "HZYWeeklyItemStageModel.h"
@interface HZYWeeklyItemCell()

@property (weak, nonatomic) IBOutlet UILabel *stageView;

@property (weak, nonatomic) IBOutlet UILabel *timeView;

@end

@implementation HZYWeeklyItemCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    HZYWeeklyItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HZYWeeklyItemCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setStageModel:(HZYWeeklyItemStageModel *)stageModel{
    
    self.stageView.text = stageModel.title;
    
    self.timeView.text = stageModel.time;
}

@end
