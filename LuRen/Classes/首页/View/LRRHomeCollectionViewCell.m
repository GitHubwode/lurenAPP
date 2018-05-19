//
//  LRRHomeCollectionViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeCollectionViewCell.h"
#import "LRRUserMessageModel.h"
#import "UIImageView+WebCache.h"

@interface LRRHomeCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;

@end

NSString *homeCollectionViewCell = @"homeCollectionViewCell";


@implementation LRRHomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(LRRUserMessageModel *)model
{
    _model = model;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatarUrl] placeholderImage:[UIImage imageNamed:@"pic_touxiang"]];
    self.nickNameLabel.text = model.nickname;
}

+ (NSString *)homeCollectionIdentifier
{
    return homeCollectionViewCell;
}

@end
