//
//  HZYHttpRequest.m
//  QinKerTravel
//
//  Created by passion on 16/3/19.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYHttpRequest.h"

@implementation HZYHttpRequest

+ (void)GET:(NSString *)URLString parameters:(NSDictionary *)para complete:(CompleteBlock)complete{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

   // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"", nil];
    
    NSString *userAgent = [NSString stringWithFormat:@"iOS/%@/3.19",[UIDevice currentDevice].name];
    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    HZYUserLoginModel *loginModel = [HZYUserLoginModel sharedUserLoginModel];
    if (loginModel.isLogin) {
        
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:loginModel.name password:loginModel.token];
    }else{
        
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"0.0.0.0" password:@"tuicool"];
    }
    
    [manager GET:URLString parameters:para success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        complete(operation , responseObject ,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        complete(operation , nil ,error);
        
    }];
}


+ (void)POST:(NSString *)URLString parameter:(NSDictionary *)parameter complete:(CompleteBlock)complete{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *userAgent = [NSString stringWithFormat:@"%@",[UIDevice currentDevice].name];
    
    //声明请求的结果为JSON类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"0.0.0.0" password:@"tuicool"];
    
    [manager POST:URLString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        complete(operation,responseObject,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        complete(operation,nil,error);
    }];
    
    
}

@end
