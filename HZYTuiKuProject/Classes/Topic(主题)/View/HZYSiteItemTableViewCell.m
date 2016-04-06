//
//  HZYSiteItemTableViewCell.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/22.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYSiteItemTableViewCell.h"

#import "HZYSiteItemModel.h"
#import <UIImageView+WebCache.h>
@interface HZYSiteItemTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *CountBtn;


@end

@implementation HZYSiteItemTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"SiteCellIdentifier";
    
    HZYSiteItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell= [[HZYSiteItemTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle]loadNibNamed:@"HZYSiteItemTableViewCell" owner:nil options:nil] lastObject];
        
        //设置cell的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.iconImageView.layer.cornerRadius = 12;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderWidth = 1;
        self.iconImageView.layer.borderColor = [UIColor colorWithRed:211 / 255.0 green:211 / 255.0 blue:211 / 255.0 alpha:1].CGColor;
        
        self.CountBtn.layer.cornerRadius = 9;
        self.CountBtn.layer.masksToBounds = YES;
        
    }
    return self;
}

-(void)setSiteItemModel:(HZYSiteItemModel *)siteItemModel{
    
    _siteItemModel = siteItemModel;
    
    self.nameLabel.text = siteItemModel.name;
 
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:siteItemModel.image] placeholderImage:[UIImage imageNamed:@"abs_pic"]];
}


@end
