//
//  LINGDiscoverCell.m
//  iphone
//
//  Created by 李晓肆 on 14-1-17.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGDiscoverCell.h"

@interface LINGDiscoverCell ()
@property (strong, nonatomic) IBOutlet UIImageView *avatar;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *flag;
@property (strong, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) IBOutlet UILabel *datetime;
@property (strong, nonatomic) IBOutlet UIButton *like;
@property (strong, nonatomic) IBOutlet UIButton *comment;

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
