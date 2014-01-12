//
//  LINGFeed.h
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGBaseModel.h"

@interface LINGFeed : LINGBaseModel
@property (nonatomic) NSUInteger feedID;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, copy) NSString *feedTitle;
@property (nonatomic, copy) NSString *feedContent;
@property (nonatomic, copy) NSString *dateTime;
@property (nonatomic) NSUInteger likeCount;
@property (nonatomic) NSUInteger commentCount;
@end
