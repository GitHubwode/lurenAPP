//
//  LRRHomeCollectionViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeCollectionViewCell.h"

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

+ (NSString *)homeCollectionIdentifier
{
    return homeCollectionViewCell;
}

@end
