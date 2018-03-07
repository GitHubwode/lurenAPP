//
//  LRRLRRServiceCenterHeaderCell.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLRRServiceCenterHeaderCell.h"
#import "LRRServiceCenterModel.h"

@interface LRRLRRServiceCenterHeaderCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeight;

@end

static NSString * serviceCenterHeaderCell = @"serviceCenterHeaderCell";

@implementation LRRLRRServiceCenterHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineHeight.constant = LRROnePixelHeight;
}

- (void)setCenterModel:(LRRServiceCenterModel *)centerModel
{
    _centerModel = centerModel;
    self.titleLabel.text = centerModel.title;
    self.subTitleLabel.text = centerModel.subTitle;
    if ([centerModel.title isEqualToString:@"电话"]) {
        self.subTitleLabel.textColor = UIColorHex(0x00b4ff);
    }
}

+ (NSString *)serviceCenterIdentifier
{
    return serviceCenterHeaderCell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
