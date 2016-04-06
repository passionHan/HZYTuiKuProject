//
//  HZYUserViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYUserViewController.h"
#import "HZYUserItemModel.h"
#import "HZYUserGroupModel.h"
#import "HZYUserLoginCell.h"
#import "HZYUserLoginController.h"
#import "HZYUserInfoController.h"
#import "HZYContentTableViewController.h"

@interface HZYUserViewController ()

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign) BOOL isLogin;

@end

@implementation HZYUserViewController

-(BOOL)isLogin{
    
    return [HZYUserLoginModel sharedUserLoginModel].isLogin;
}

-(NSArray *)dataArray{
    
    if (_dataArray== nil) {
        
        
        HZYUserItemModel *model00 = [HZYUserItemModel userItemModelWithName:@"点击登录" icon:@"default_avatar"];
        HZYUserGroupModel *group0 = [HZYUserGroupModel userGroupModelWithModelArray:@[model00]];
        
        HZYUserItemModel *model10 = [HZYUserItemModel userItemModelWithName:@"我的待读" urlstring:@"http://api.tuicool.com/api/articles/late.json?size=200"];
        HZYUserItemModel *model11 = [HZYUserItemModel userItemModelWithName:@"我的收藏" urlstring:@"http://api.tuicool.com/api/articles/my.json?size=30"];
        HZYUserItemModel *model12 = [HZYUserItemModel userItemModelWithName:@"我的推刊" urlstring:@"http://api.tuicool.com/api/kans/my.json"];
        HZYUserGroupModel *group1 = [HZYUserGroupModel userGroupModelWithModelArray:@[model10,model11,model12]];
        
        HZYUserItemModel *model20 = [HZYUserItemModel userItemModelWithName:@"夜间模式" swich:YES];
        HZYUserItemModel *model21 = [HZYUserItemModel userItemModelWithName:@"离线阅读"];
        HZYUserItemModel *model22 = [HZYUserItemModel userItemModelWithName:@"相关设置"];
        HZYUserItemModel *model23 = [HZYUserItemModel userItemModelWithName:@"意见反馈"];
        HZYUserItemModel *model24 = [HZYUserItemModel userItemModelWithName:@"请求鼓励"];
        HZYUserItemModel *model25 = [HZYUserItemModel userItemModelWithName:@"关于我们"];
        HZYUserGroupModel *group2 = [HZYUserGroupModel userGroupModelWithModelArray:@[model20,model21,model22,model23,model24,model25]];
        _dataArray = @[group0,group1,group2];
        
    }
    
    return _dataArray;
}

+(instancetype)userview{
    
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"HZYUserViewController" bundle:nil];
    
    HZYUserViewController *user = [st instantiateInitialViewController];
    
    return user;
    
}

-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.sectionHeaderHeight = 1;
    self.tableView.sectionFooterHeight = 18;
    
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 1)];
    
    self.navigationItem.leftBarButtonItem = nil;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginSuccess) name:@"HZYUserLoginControllerLoginSuccess" object:nil];
}

#pragma mark - 登录成功
-(void)loginSuccess{
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray[section] itemModelArray].count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HZYUserGroupModel *group = self.dataArray[indexPath.section];
    HZYUserItemModel *itemModel = group.itemModelArray[indexPath.row];
    
    NSString *loginIdentifier = @"";
    
    if (indexPath.section == 0) {
        
        loginIdentifier = @"loginIdentifier0";
        
        HZYUserLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:loginIdentifier];
        
        if (cell == nil) {
            
            cell = [HZYUserLoginCell userLoginCell];
            
        }
        
        cell.itemModel = itemModel;
        
        return cell;
        
    }else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:loginIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginIdentifier];
        }
        
        cell.textLabel.text = itemModel.name;
        
        if (itemModel.swich) {
            
            cell.accessoryView = [[UISwitch alloc]init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }else{
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 65;
        
    }else{
        
        return 44;
    }
    
}

#pragma mark - 选中cell进行跳转

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYUserGroupModel *group = self.dataArray[indexPath.section];
    HZYUserItemModel *itemModel = group.itemModelArray[indexPath.row];
    if (indexPath.section == 0) {
        
        if (self.isLogin) {
            
            HZYUserViewController *userInfo = [[HZYUserViewController alloc]init];
            [self.navigationController pushViewController:userInfo animated:YES];
            
        }else{
            
            HZYUserLoginController *login = [[HZYUserLoginController alloc]init];
            
            [self.navigationController pushViewController:login animated:YES];
            
        }
        
    }else if (indexPath.section == 1){
        
        if ([HZYUserLoginModel sharedUserLoginModel].isLogin) {
            
            HZYContentTableViewController *contentTable = [[HZYContentTableViewController alloc]init];
            
            contentTable.urlstring = itemModel.urlstring;
            
            contentTable.title = itemModel.name;
            
            [self.navigationController pushViewController:contentTable animated:YES];
            
        }else{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请登录后查看！" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

@end
