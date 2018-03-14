//
//  LRRHomeReportViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/14.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeReportViewCell.h"
#import "UIImageView+WebCache.h"


static NSString *LRRHomeReportViewTyf = @"LRRHomeReportViewTyf";
@interface LRRHomeReportViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *themeImageView;

@end

@implementation LRRHomeReportViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (NSString *)reportIdentifier
{
    return LRRHomeReportViewTyf;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
