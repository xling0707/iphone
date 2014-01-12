//
//  LINGAPIClient.m
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGAPIClient.h"

static NSString * const APIBaseURLString = @"https://localhost/api";

@implementation LINGAPIClient
+ (instancetype)sharedClient
{
    static LINGAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LINGAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        // 不使用加密
		[_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone]];
    });
    
    return _sharedClient;
}
@end
