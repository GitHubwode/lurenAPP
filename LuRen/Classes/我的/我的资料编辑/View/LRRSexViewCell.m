//
//  LRRSexViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSexViewCell.h"
#import "LRRCustomInfoItem.h"

static NSString *LRRSexCellIdfy = @"LRRSexCellIdfy";


@interface LRRSexViewCell ()<LRRSexFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *indicatorImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeight;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end


@implementation LRRSexViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineViewHeight.constant = LRROnePixelHeight;
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.tintColor = LRROrangeThemeColor;
    self.textField.placeholderColor = LRRTimeTextColor;
    self.textField.textColor = LRRContentTextColor;
    self.textField.font = LRRFont(12);
    self.textField.sexDelegate = self;
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.textField.placeholder = infoItem.placeholder;
    self.textField.text = infoItem.subtitle;
    self.indicatorImageView.hidden = infoItem.hidenIndicator;
    self.lineView.hidden = infoItem.hidenLine;
}

- (void)dealloc{
    LRRLogFunc
}


+ (NSString *)cellIdentifier{
    return LRRSexCellIdfy;
}


#pragma mark - SNHSexFieldDelegate
- (void)ensureButtonClicked{
    if (self.infoItem.editabled) {
        self.infoItem.subtitle = self.textField.text;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
