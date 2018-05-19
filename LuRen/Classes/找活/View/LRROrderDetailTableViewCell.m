//
//  LRROrderDetailTableViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/23.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRROrderDetailTableViewCell.h"
#import "LRROrderDetailsModel.h"

@interface LRROrderDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *statusButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
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
    self.distanceLabel.hidden = YES;
}

- (void)setOrderModel:(LRROrderDetailsModel *)orderModel
{
    _orderModel = orderModel;
    LRRLog(@"%@",orderModel.type);
    
    self.titleLabel.text = orderModel.orderDetails;
    self.peopleLabel.text = [NSString stringWithFormat:@"人数: %lu人",(unsigned long)orderModel.number];
    
    NSString *unitString = [NSString stringWithFormat:@"%.f",orderModel.unitPrice];
    NSString *string1 = [NSString stringWithFormat:@"工价: %.f元/天",orderModel.unitPrice];
    self.moneyLabel.attributedText = [self firstString:string1 SecondString:unitString];
    
    NSString *fareString = [NSString stringWithFormat:@"%.f",orderModel.fare];
    NSString *string2 =  [NSString stringWithFormat:@"车费: %.f/辆/天",orderModel.fare];
    
    self.carLabel.attributedText = [self firstString:string2 SecondString:fareString];
    self.orderTimeLabel.text = [NSString stringWithFormat:@"%@",orderModel.workStartTime];
    self.distanceLabel.text = [NSString stringWithFormat:@"%@",orderModel.instance];
    
    self.startLabel.text = [NSString stringWithFormat:@"%@--%@",orderModel.workStartTime,orderModel.workEndTime];
    
    self.introduceLabel.text = orderModel.projectDesc;
    self.markLabel.text = orderModel.remark;
    self.liveLabel.text = orderModel.isLive;
    self.nemaLabel.text = orderModel.contacts;
    self.addressLabel.text = orderModel.address;
    self.numberLabel.text = [NSString stringWithFormat:@"%lu人",(unsigned long)orderModel.number];
    self.totalLabel.text =orderModel.orderDetailsList;
}

- (NSAttributedString *)firstString:(NSString *)string SecondString:(NSString *)secondString
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSForegroundColorAttributeName value:LRRMoneyTitleColor range:NSMakeRange(3, secondString.length+1)];
    return attributedString;
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
