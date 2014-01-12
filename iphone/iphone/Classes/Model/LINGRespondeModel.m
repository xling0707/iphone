//
//  LINGRespondeModel.m
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGRespondeModel.h"

@implementation LINGRespondeModel
- (instancetype) initWithDictionary : (NSDictionary *)dict
{
    self = [super init];
    if (self && dict) {
        self.data = dict[@"data"];
        self.err = [dict[@"err"] integerValue];
        self.msg = dict[@"msg"];
    }
    return self;
}
- (BOOL)ok{
    return  self.err == 0;
}
@end
