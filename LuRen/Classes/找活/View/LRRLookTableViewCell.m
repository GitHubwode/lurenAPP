//
//  LRRLookTableViewCell.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLookTableViewCell.h"
#import "LRROrderDetailsModel.h"

@interface LRRLookTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line1View;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line2View;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;//是否拼单
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//地址 工种
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;//人数
@property (weak, nonatomic) IBOutlet UILabel *singleLabel;//单价
@property (weak, nonatomic) IBOutlet UILabel *carLabel;//车费
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;//开始时间
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;//距离
@end

static NSString *lookTableViewCell = @"lookTableViewCell";

@implementation LRRLookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.line1View.constant = LRROnePixelHeight;
    self.line2View.constant = LRROnePixelHeight;
    self.distanceLabel.hidden = YES;
}

- (void)setOrderModel:(LRROrderDetailsModel *)orderModel
{
    _orderModel = orderModel;
    
    
    
    self.titleLabel.text = orderModel.orderDetails;
    if (orderModel.status==1) {
        //点工
        self.peopleLabel.text = [NSString stringWithFormat:@"人数: %lu人",(unsigned long)orderModel.number];
        self.statusLabel.text = orderModel.workType;
        NSString *unitString = [NSString stringWithFormat:@"%.f",orderModel.unitPrice];
        NSString *string1 = [NSString stringWithFormat:@"工价: %.f元/天",orderModel.unitPrice];
        self.singleLabel.attributedText = [self firstString:string1 SecondString:unitString];
    }else{
        //点包
        self.peopleLabel.text = [NSString stringWithFormat:@"工程量: %@平米",orderModel.workAmount];
        self.statusLabel.text = orderModel.workType;
        NSString *unitString = [NSString stringWithFormat:@"%.f",orderModel.unitPrice];
        NSString *string1 = [NSString stringWithFormat:@"单价: %.f元/平米",orderModel.unitPrice];
        self.singleLabel.attributedText = [self firstString:string1 SecondString:unitString];
    }
    
    NSString *fareString = [NSString stringWithFormat:@"%.f",orderModel.fare];
    NSString *string2 =  [NSString stringWithFormat:@"车费: %.f元/辆/天",orderModel.fare];

    self.carLabel.attributedText = [self firstString:string2 SecondString:fareString];
    self.timeLabel.text = [NSString stringWithFormat:@"%@",orderModel.workStartTime];
    self.distanceLabel.text = [NSString stringWithFormat:@"%@",orderModel.instance];
    
    LRRLog(@"888%@",orderModel.type);
}

- (NSAttributedString *)firstString:(NSString *)string SecondString:(NSString *)secondString
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSForegroundColorAttributeName value:LRRMoneyTitleColor range:NSMakeRange(3, secondString.length+1)];
    return attributedString;
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
