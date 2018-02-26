//
//  LRROrderDetailTableViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/23.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRROrderDetailTableViewCell.h"

@interface LRROrderDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *statusButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *markLabel;
@property (weak, nonatomic) IBOutlet UILabel *liveLabel;
@property (weak, nonatomic) IBOutlet UILabel *nemaLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *carLabel;

@property (weak, nonatomic) IBOutlet UIView *lineView1;
@property (weak, nonatomic) IBOutlet UIView *lineView2;
@property (weak, nonatomic) IBOutlet UIView *lineView3;
@property (weak, nonatomic) IBOutlet UIView *lineView4;
@property (weak, nonatomic) IBOutlet UIView *lineView5;
@property (weak, nonatomic) IBOutlet UIView *lineView6;
@property (weak, nonatomic) IBOutlet UIView *lineView7;

@end

static  NSString *const orderDetailTableViewCell = @"orderDetailTableViewCell";

@implementation LRROrderDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineView1.contentMode = LRROnePixelHeight;
    self.lineView2.contentMode = LRROnePixelHeight;
    self.lineView3.contentMode = LRROnePixelHeight;
    self.lineView4.contentMode = LRROnePixelHeight;
    self.lineView5.contentMode = LRROnePixelHeight;
    self.lineView6.contentMode = LRROnePixelHeight;
    self.lineView7.contentMode = LRROnePixelHeight;
    self.statusButton.layer.masksToBounds = YES;
    self.statusButton.layer.cornerRadius = 5.f;
}
+ (NSString *)orderDetailIdentifier
{
    return orderDetailTableViewCell;
}
- (IBAction)moreButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(moreChargeStandardButtonClick:)]) {
        [self.delegate moreChargeStandardButtonClick:sender];
    }
}
- (IBAction)orderButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(orderDetailButtonClick:)]) {
        [self.delegate orderDetailButtonClick:sender];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
