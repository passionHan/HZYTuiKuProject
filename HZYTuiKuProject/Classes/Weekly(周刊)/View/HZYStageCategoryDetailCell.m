//
//  HZYStageCategoryDetailCell.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYStageCategoryDetailCell.h"
#import "HZYWeeklyItemStageCategoryDetail.h"
#import "HZYCategoryDetailFrameModel.h"
@interface HZYStageCategoryDetailCell()

@property (nonatomic ,strong) UILabel *titleLabel;


@end

@implementation HZYStageCategoryDetailCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"categoryDetailCel";
    
    HZYStageCategoryDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[HZYStageCategoryDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.titleLabel = [[UILabel alloc] init];
        
        self.titleLabel.font = HZYWeeklyCateforyDetailFont;
        
        self.titleLabel.numberOfLines = 0;
        
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)setFrameModel:(HZYCategoryDetailFrameModel *)frameModel{
    
    self.titleLabel.text = frameModel.detailModel.title;
    
    self.titleLabel.frame = frameModel.titleF;
    
}




@end
