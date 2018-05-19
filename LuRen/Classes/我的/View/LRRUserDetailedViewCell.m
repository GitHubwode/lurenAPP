//
//  LRRUserDetailedViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRUserDetailedViewCell.h"

@interface LRRUserDetailedViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

static NSString * userDetailedViewCell = @"userDetailedViewCell";


@implementation LRRUserDetailedViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [UILabel changeLineSpaceForLabel:self.subTitleLabel WithSpace:5.f];
}

- (void)changeUserMessage
{
//    if () {
//        <#statements#>
//    }

}

+ (NSString *)userDetailedIdentifier
{
    return userDetailedViewCell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
