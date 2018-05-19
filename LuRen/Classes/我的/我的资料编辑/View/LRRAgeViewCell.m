//
//  LRRAgeViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRAgeViewCell.h"
#import "LRRCustomInfoItem.h"

static NSString *LRRAgeCellIdfy = @"LRRAgeCellIdfy";

@interface LRRAgeViewCell ()<LRRAgeFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *indicatorImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeight;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end

@implementation LRRAgeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineViewHeight.constant = LRROnePixelHeight;
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.tintColor = LRROrangeThemeColor;
    self.textField.placeholderColor = LRRTimeTextColor;
    self.textField.textColor = LRRContentTextColor;
    self.textField.font = LRRFont(12);
    self.textField.ageDelegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.textField.placeholder = infoItem.placeholder;
    self.textField.text = [LRRUserManager sharedUserManager].currentUser.workAge;
    self.indicatorImageView.hidden = infoItem.hidenIndicator;
    self.lineView.hidden = infoItem.hidenLine;
}

- (void)dealloc{
    LRRLogFunc
}

+ (NSString *)cellIdentifier{
    return LRRAgeCellIdfy;
}

#pragma mark - LRRAgeFieldDelegate
- (void)ensureButtonClicked{
    if (self.infoItem.editabled) {
        self.infoItem.subtitle = self.textField.text;
    }
}


@end
