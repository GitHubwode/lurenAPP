//
//  LRREmployingViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/10.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRREmployingViewCell.h"

@interface LRREmployingViewCell ()


@end

static NSString *employingViewIdentifier = @"employingViewIdentifier";

@implementation LRREmployingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)FocusOnButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

+ (NSString *)employIdentifier
{
    return employingViewIdentifier;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
