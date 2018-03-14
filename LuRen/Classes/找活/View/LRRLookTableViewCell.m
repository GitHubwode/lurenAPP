//
//  LRRLookTableViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLookTableViewCell.h"

@interface LRRLookTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line1View;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line2View;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleLabel;
@property (weak, nonatomic) IBOutlet UILabel *carLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@end

static NSString *lookTableViewCell = @"lookTableViewCell";

@implementation LRRLookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.line1View.constant = LRROnePixelHeight;
    self.line2View.constant = LRROnePixelHeight;
}

+ (NSString *)lookIdentifier
{
    return lookTableViewCell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
