//
//  LRRSystemMessageViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/14.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSystemMessageViewCell.h"

static NSString *LRRSystemMessageViewTyf = @"LRRSystemMessageViewTyf";

@interface LRRSystemMessageViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *systyLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWidth;

@end

@implementation LRRSystemMessageViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.labelWidth.constant = LRRAdaptedWidth(1);
}

+ (NSString *)systemIdentifier
{
    return LRRSystemMessageViewTyf;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
