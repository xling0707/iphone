//
//  LINGAPIClient.h
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import <AFHTTPRequestOperationManager.h>
#import "LINGRespondeModel.h"



typedef void(^apiCallback)(LINGRespondeModel *response, NSError *error);

@interface LINGAPIClient : AFHTTPRequestOperationManager
+ (instancetype) sharedClient;

/*!
 *  登录
 *
 *  @param name     用户名
 *  @param password 密码
 *  @param block    回调函数
 *
 *  @return 请求
 */

- (AFHTTPRequestOperation *)loginWithName :(NSString *)name withPassword : (NSString *)password withBlock:(apiCallback)block;

@end
