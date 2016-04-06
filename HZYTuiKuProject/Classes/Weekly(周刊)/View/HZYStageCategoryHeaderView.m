//
//  HZYStageCategoryHeaderView.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYStageCategoryHeaderView.h"
#import "HZYWeeklyItemStageDetailModel.h"

@interface HZYStageCategoryHeaderView()

@property (nonatomic ,strong) UILabel *categoryName;


@end

@implementation HZYStageCategoryHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"cagegoryHeaer";
    
    HZYStageCategoryHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (!header) {
        
        header = [[HZYStageCategoryHeaderView alloc] initWithReuseIdentifier:ID];
        
    }
    
    return header;
    
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //添加控件
        self.categoryName = [[UILabel alloc] init];
        self.categoryName.textColor = NavColor;
        self.categoryName.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.categoryName];
        
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.categoryName.frame = CGRectMake(5, 0, 100, self.height);
}

- (void)setDetailModel:(HZYWeeklyItemStageDetailModel *)detailModel{
    
    self.categoryName.text = detailModel.name;
}



@end
