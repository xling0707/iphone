//
//  LINGLoginManager.m
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGLoginManager.h"

#define KEYCHAIN_SERVICE_NAME (@"com.xianlvke.iphone")
#define KEYCHAIN_ACCOUNT_NAME (@"com.xianlvke.iphone.token")

@implementation LINGLoginManager
- (BOOL)isLogin{
    return self.password.length > 0;
}
+ (instancetype)sharedManager
{
    static LINGLoginManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[LINGLoginManager alloc] init];
        _sharedManager.service = KEYCHAIN_SERVICE_NAME;
        _sharedManager.account = KEYCHAIN_ACCOUNT_NAME;
        NSError *error = nil;
        if ([_sharedManager fetch:&error]) {
            DDLogInfo(@"fetch token success");
        }
        else{
            DDLogVerbose(@"fetch token error : %@",error);
        }
    });
    return _sharedManager;
}
@end
