//
//  LINGLoginManager.h
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import <SSKeychainQuery.h>

@interface LINGLoginManager : SSKeychainQuery
+ (instancetype) sharedManager;
- (BOOL) isLogin;
@end
