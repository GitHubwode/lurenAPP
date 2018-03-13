//
//  LRRPublishTimeViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishTimeViewCell.h"
#import "LRRCustomInfoItem.h"

static NSString *LRRPublishTimeCellIdfy = @"LRRPublishTimeCellIdfy";

@interface LRRPublishTimeViewCell ()<LRRChooseTimeFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeight;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end

@implementation LRRPublishTimeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineViewHeight.constant = LRROnePixelHeight;
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.tintColor = LRROrangeThemeColor;
    self.textField.placeholderColor = LRRTimeTextColor;
    self.textField.textColor = LRRContentTextColor;
    self.textField.font = LRRFont(12);
    self.textField.chooseTimeDelegate = self;
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.textField.placeholder = infoItem.placeholder;
    self.textField.text = infoItem.subtitle;
    self.lineView.hidden = infoItem.hidenLine;
}

+ (NSString *)cellIdentifier{
    return LRRPublishTimeCellIdfy;
}

#pragma mark - LRRChooseTimeFieldDelegate
- (void)ensureButtonClicked{
    if (self.infoItem.editabled) {
        self.infoItem.subtitle = self.textField.text;
    }
}
- (void)dealloc{
    LRRLogFunc
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
