//
//  LRRPublishWriteViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishWriteViewCell.h"
#import "LRRCustomInfoItem.h"

static NSString *LRRPublishWriteCellIdfy = @"LRRPublishWriteCellIdfy";


@interface LRRPublishWriteViewCell ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeight;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *unitTitleLabel;

@end

@implementation LRRPublishWriteViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineViewHeight.constant = LRROnePixelHeight;
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.tintColor = LRROrangeThemeColor;
    self.textField.placeholderColor = LRRTimeTextColor;
    self.textField.textColor = LRRContentTextColor;
    self.textField.font = LRRFont(12);
    self.textField.delegate = self;
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.textField.placeholder = infoItem.placeholder;
    self.textField.text = infoItem.subtitle;
    self.lineView.hidden = infoItem.hidenLine;
    self.unitTitleLabel.text = infoItem.unitTitle;
}

- (void)dealloc{
    LRRLogFunc
}

+ (NSString *)cellIdentifier{
    return LRRPublishWriteCellIdfy;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
