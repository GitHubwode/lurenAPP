//
//  LRRAvatarViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRAvatarViewCell.h"

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

+ (NSString *)cellIdentifier
{
    return LRRAvatarCellIdfy;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
