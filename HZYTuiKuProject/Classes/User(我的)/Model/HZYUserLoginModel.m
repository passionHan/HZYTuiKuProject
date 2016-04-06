//
//  HZYUserLoginModel.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYUserLoginModel.h"
#import "HZYUserMessgerModel.h"
@implementation HZYUserLoginModel

/**
 *  创建单例
 *
 *  @return 登录模型
 */
+(instancetype)sharedUserLoginModel{
    
    static HZYUserLoginModel *instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[HZYUserLoginModel alloc]init];
        
    });
    return instance;
}

-(instancetype)init{
    
    if (self = [super init]) {
        self.userInfoModel = [HZYUserMessgerModel readUserInfo];
    }
    return self;
}

-(NSString *)name{
    
    return self.userInfoModel.name;
    
}

-(NSString *)email{
    
    return self.userInfoModel.email;
}

-(NSString *)token{
    
    return self.userInfoModel.token;
    
}

-(NSString *)id{
    
    return self.userInfoModel.id;
}

-(BOOL)isLogin{
    
    return self.token == nil ? NO : YES;
}

- (void)getUserInfoWith:(NSDictionary *)loginMessageDic sendLoginRequest:(SendLoginRequest)requestLogin requestFailed:(requestFailed)requestFailed{
    
    [HZYHttpRequest POST:@"http://api.tuicool.com/api/login.json" parameter:loginMessageDic complete:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        
        //请求成功
        if (!error) {
            
            //登录成功
            if (responseObject[@"success"]) {
                
                NSDictionary *userDict = responseObject[@"user"];
                
                HZYUserMessgerModel *model = [HZYUserMessgerModel userMessageModelWithDictionary:userDict];
                
                self.userInfoModel = model;
                
                //保存用户数据
                [model saveUserInfo];
                
                requestLogin(@"success");
                
                //登录失败
            }else{
                
                requestLogin(responseObject[@"error"]);
            }
            
        }else{
            //请求失败
            requestFailed(error);
        }
        
    }];
}


@end
