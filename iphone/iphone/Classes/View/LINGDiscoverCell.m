//
//  LINGDiscoverCell.m
//  iphone
//
//  Created by 李晓肆 on 14-1-17.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGDiscoverCell.h"

@interface LINGDiscoverCell ()
/*!
 *  头像
 */
@property (strong, nonatomic) IBOutlet UIImageView *avatar;
/*!
 *  标题
 */
@property (strong, nonatomic) IBOutlet UILabel *title;
/*!
 *  是否是小鲜
 */
@property (strong, nonatomic) IBOutlet UIImageView *flag;
/*!
 *  内容
 */
@property (strong, nonatomic) IBOutlet UITextView *content;
/*!
 *  时间
 */
@property (strong, nonatomic) IBOutlet UILabel *datetime;
/*!
 *  喜欢数
 */
@property (strong, nonatomic) IBOutlet UIButton *like;
/*!
 *  评论数
 */
@property (strong, nonatomic) IBOutlet UIButton *comment;

/*!
 *  相关图片
 */

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *images;

@end

@implementation LINGDiscoverCell

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
