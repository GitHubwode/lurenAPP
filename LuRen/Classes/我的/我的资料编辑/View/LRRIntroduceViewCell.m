//
//  LRRIntroduceViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRIntroduceViewCell.h"
#import "LRRCustomInfoItem.h"
#import "UITextView+Placeholder.h"

static NSString *LRRIntroduceViewIdfy = @"LRRIntroduceViewIdfy";


@interface LRRIntroduceViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *subTitleTextView;

@end

@implementation LRRIntroduceViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.subTitleTextView.placeholder = infoItem.placeholder;
    self.subTitleTextView.text = infoItem.subtitle;
}

+ (NSString *)cellIdentifier
{
    return LRRIntroduceViewIdfy;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
