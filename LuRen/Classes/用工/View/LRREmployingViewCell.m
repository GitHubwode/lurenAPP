//
//  LRREmployingViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/10.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRREmployingViewCell.h"
#import "LRRUserMessageModel.h"
#import "UIImageView+WebCache.h"
@interface LRREmployingViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *readNameImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;
@property (weak, nonatomic) IBOutlet UIButton *focusButton;

@end

static NSString *employingViewIdentifier = @"employingViewIdentifier";

@implementation LRREmployingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.readNameImageView.hidden = YES;
    self.focusButton.hidden = YES;
}

-(void)setModel:(LRRUserMessageModel *)model
{
    _model = model;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatarUrl] placeholderImage:[UIImage imageNamed:@"pic_touxiang"]];
    self.nameLabel.text = model.nickname;
    self.teamLabel.text = [NSString stringWithFormat:@"团队:%@人",model.teamGroup];
}

- (IBAction)FocusOnButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

+ (NSString *)employIdentifier
{
    return employingViewIdentifier;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
