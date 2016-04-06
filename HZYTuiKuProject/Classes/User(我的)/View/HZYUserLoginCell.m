//
//  HZYUserLoginCell.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYUserLoginCell.h"
#import "HZYUserItemModel.h"
#import "HZYUserMessgerModel.h"
#import <UIImageView+WebCache.h>
@interface HZYUserLoginCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;


@end

@implementation HZYUserLoginCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"HZYUserLoginCell" owner:nil options:nil] lastObject];
    }
    return self;
}

+(instancetype)userLoginCell{
    
    HZYUserLoginCell *cell =[[[NSBundle mainBundle]loadNibNamed:@"HZYUserLoginCell" owner:nil options:nil] lastObject];
    
    return cell;
}

-(void)setItemModel:(HZYUserItemModel *)itemModel{
    
    _itemModel = itemModel;
    
    if ([HZYUserLoginModel sharedUserLoginModel].isLogin) {
        
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[HZYUserLoginModel sharedUserLoginModel].userInfoModel.profile] placeholderImage:[UIImage imageNamed:itemModel.icon]];
        
        self.NameLabel.text = [HZYUserLoginModel sharedUserLoginModel].userInfoModel.name;
        
    }
    self.iconImageView.image = [UIImage imageNamed:itemModel.icon];
    self.NameLabel.text = itemModel.name;
    
}

@end
