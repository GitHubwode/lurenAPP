//
//  LRRMeTableViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRMeTableViewCell.h"
#import "LRRMeMessageModel.h"

@interface LRRMeTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeight;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

NSString *meTableViewCell = @"meTableViewCell";

@implementation LRRMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineHeight.constant = LRROnePixelHeight;
}

- (void)setItem:(LRRMeMessageModel *)item
{
    _item = item;
    self.iconImageView.image = [UIImage imageNamed:item.iconString];
    self.nameLabel.text = item.titleString;
    if (item.isTitle == NO) {
        self.subTitleLabel.text = item.subTitleString;
    }
    if (item.isStatus == YES) {
        self.statusLabel.hidden = YES;
    }
}

+ (NSString *)meTableCellIdentifier
{
    return meTableViewCell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
