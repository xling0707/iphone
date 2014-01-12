//
//  LINGDiscoverTableViewCell.m
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGDiscoverTableViewCell.h"

@interface LINGDiscoverTableViewCell ()

/*!
 *  头像
 */
@property (nonatomic, strong) UIButton *avatarButton;
/*!
 *  标题
 */
@property (nonatomic, strong) UILabel *feedTitle;
/*!
 *  是否小鲜
 */
@property (nonatomic, strong) UIImageView *guideStar;
/*!
 *  feed 的内容
 */
@property (nonatomic, strong) UITextView *feedContent;
/*!
 *  时间
 */
@property (nonatomic, strong) UILabel *dateTime;
/*!
 *  喜欢
 */
@property (nonatomic, strong) UIButton *likeButton;
/*!
 *  评论
 */
@property (nonatomic, strong) UIButton *commentButton;

@end
@implementation LINGDiscoverTableViewCell

- (void)setFeed:(LINGFeed *)feed
{
    _feed = feed;
    
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
