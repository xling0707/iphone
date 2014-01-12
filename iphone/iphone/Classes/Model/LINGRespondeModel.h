//
//  LINGRespondeModel.h
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 * - msg
 * - html
 * - err
 * - data
 */
@interface LINGRespondeModel : NSObject
/*!
 *  错误信息
 */
@property (nonatomic, copy) NSString *msg;
/*!
 *  是否错误
 */
@property (nonatomic) NSInteger err;
/*!
 *  返回的数据
 */
@property (nonatomic, strong) NSDictionary *data;
- (instancetype) initWithDictionary : (NSDictionary *)dict;
- (BOOL)ok;
@end
