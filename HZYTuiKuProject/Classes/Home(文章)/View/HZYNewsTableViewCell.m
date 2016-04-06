//
//  HZYNewsTableViewCell.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYNewsTableViewCell.h"

#import "HZYArticleModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HZYNewsTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *feed_titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@end

@implementation HZYNewsTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView imageCount:(NSInteger)count{
    
    NSString *ID = @"";
    if (count > 0) {
        
        ID = @"HZYNewsTableViewCell";
        
    }else{
        
        ID = @"HZYNewsTableViewCell1";
        
    }
    
    HZYNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        if ([ID isEqualToString:@"HZYNewsTableViewCell"]) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HZYNewsTableViewCell" owner:nil options:nil] lastObject];
        }else{
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HZYNewsTableViewCell" owner:nil options:nil] firstObject];
        }
    }
    
    return cell;
}



-(void)setArticleModel:(HZYArticleModel *)articleModel{
    
    _articleModel = articleModel;
    
    self.titleLabel.text = articleModel.title;
    self.feed_titleLabel.text = articleModel.feed_title;
    self.timeLabel.text = articleModel.time;
    
    if (articleModel.img) {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:articleModel.img] placeholderImage:[UIImage imageNamed:@"abs_pic"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            if (error) {
                self.iconImageView.image = [UIImage imageNamed:@"abs_pic_broken"];
            }
            
        }];
    }
}

@end
