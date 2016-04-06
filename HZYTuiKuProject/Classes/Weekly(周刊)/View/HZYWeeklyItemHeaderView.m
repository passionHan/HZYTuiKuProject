//
//  HZYWeeklyItemHeaderView.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/23.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYWeeklyItemHeaderView.h"
#import "HZYWeeklyItemModel.h"
@interface HZYWeeklyItemHeaderView()

@property (nonatomic ,strong) UILabel *moreLabel;
@property (nonatomic ,assign) int index;



@end

@implementation HZYWeeklyItemHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"header";
    
    HZYWeeklyItemHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (!header) {
        
        header = [[HZYWeeklyItemHeaderView alloc] initWithReuseIdentifier:ID];
        
    }
    
    return header;

}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //添加控件
        self.weeklyItemLabel = [[UILabel alloc] init];
        self.weeklyItemLabel.textColor = NavColor;
        self.weeklyItemLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.weeklyItemLabel];

        self.moreLabel = [[UILabel alloc] init];
        self.moreLabel.text = @"更多>>";
        self.moreLabel.tag = self.index;
        self.moreLabel.font = [UIFont systemFontOfSize:14];
        [self.moreLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreBtnDidClick:)]];
        [self.contentView addSubview:self.moreLabel];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.weeklyItemLabel.frame = CGRectMake(5, 0, 80, self.height);
    
    CGFloat moreLabelW = 60;
    //在这里设置用户交互属性才有效
    self.moreLabel.userInteractionEnabled = YES;
    self.moreLabel.frame = CGRectMake(kScreenWidth - moreLabelW, 0, moreLabelW, self.height);
}
- (void)moreBtnDidClick:(UITapGestureRecognizer *)tap{
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickMoreLabel:viewForItemType:)]) {
        
        [self.delegate headerViewDidClickMoreLabel:self viewForItemType:self.weeklyItemLabel.tag];
    }
}

- (void)setItemModel:(HZYWeeklyItemModel *)itemModel{
    
    self.weeklyItemLabel.text = itemModel.name;
    
    self.weeklyItemLabel.tag = itemModel.type;
}

@end
