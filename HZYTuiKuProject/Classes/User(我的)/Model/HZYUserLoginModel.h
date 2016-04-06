//
//  HZYUserLoginModel.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HZYUserMessgerModel;
typedef void(^SendLoginRequest)(NSString *loginResult);
typedef void(^requestFailed)(NSError *error);

@interface HZYUserLoginModel : NSObject

@property (nonatomic,strong) HZYUserMessgerModel *userInfoModel;

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *email;

@property (nonatomic,copy) NSString *token;
/**
 *  判断是否登录
 */
@property (nonatomic,assign) BOOL isLogin;

/**
 *  单例创建用户登录信息
 *
 *  @return 用户登录信息
 */
+(instancetype)sharedUserLoginModel;

/**
 *  发送请求获得用户信息
 *
 *  @param loginMessageDic 登录发送的字典数据（用户名密码）
 *  @param requestLogin    请求成功的回调（登录成功,登录失败）
 *  @param requestFailed   请求失败的回调
 */
-(void)getUserInfoWith:(NSDictionary *)loginMessageDic sendLoginRequest:(SendLoginRequest)requestLogin requestFailed:(requestFailed)requestFailed;
@end
