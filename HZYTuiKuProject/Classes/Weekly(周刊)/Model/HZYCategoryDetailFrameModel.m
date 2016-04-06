//
//  HZYCategoryDetailFrameModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/24.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYCategoryDetailFrameModel.h"
#import "HZYWeeklyItemStageCategoryDetail.h"
@implementation HZYCategoryDetailFrameModel

- (void)setDetailModel:(HZYWeeklyItemStageCategoryDetail *)detailModel{
    
    _detailModel = detailModel;
    
    
    CGFloat titleX = 10;
    CGFloat titleY = 10;
    
    CGSize maxSize = CGSizeMake(kScreenWidth - 20, MAXFLOAT);
    CGSize titleSize = [self sizeWithText:detailModel.title font:HZYWeeklyCateforyDetailFont maxSize:maxSize];

    _titleF = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
    
    _cellHeight = titleSize.height + 20;
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
