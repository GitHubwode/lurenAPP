//
//  LRRAvatarViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRAvatarViewCell.h"
#import "LRRCustomInfoItem.h"
#import "UIImageView+WebCache.h"

static NSString *LRRAvatarCellIdfy = @"LRRAvatarCellIdfy";


@interface LRRAvatarViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation LRRAvatarViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    NSString *avatar = [LRRUserManager sharedUserManager].currentUser.avatarUrl;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:@"pic_touxiang"]];
}

+ (NSString *)cellIdentifier
{
    return LRRAvatarCellIdfy;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
