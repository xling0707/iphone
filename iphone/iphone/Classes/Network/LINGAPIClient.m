//
//  LINGAPIClient.m
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGAPIClient.h"
#import "LINGLoginManager.h"

static NSString * const APIBaseURLString = @"http://localhost/api";

static NSString * const kLogin = @"login";



@implementation LINGAPIClient
+ (instancetype)sharedClient
{
    static LINGAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LINGAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        // set token;
        if ([[LINGLoginManager sharedManager] isLogin]) {
            [_sharedClient.requestSerializer setAuthorizationHeaderFieldWithToken:[LINGLoginManager sharedManager].password];
        }
    });
    
    return _sharedClient;
}


- (AFHTTPRequestOperation *)loginWithName:(NSString *)name withPassword:(NSString *)password withBlock:(apiCallback)block
{
    return [self POST:kLogin parameters:@{@"name" : name ,@"password" : password} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        LINGRespondeModel *model = [[LINGRespondeModel alloc] initWithDictionary:responseObject];
        block(model,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil,error);
    }];
}
@end
