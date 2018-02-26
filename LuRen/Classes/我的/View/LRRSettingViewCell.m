//
//  LRRSettingViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/18.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSettingViewCell.h"

@interface LRRSettingViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeight;

@end

NSString *settingViewCell = @"settingViewCell";


@implementation LRRSettingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineHeight.constant = LRROnePixelHeight;
}

+ (NSString *)settingIdenfier
{
    return settingViewCell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
