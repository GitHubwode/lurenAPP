//
//  LRRMeHeaderView.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRMeHeaderView.h"
#import "UIImageView+WebCache.h"

@interface  LRRMeHeaderView ()

@property (nonatomic, strong) UIImageView *headerImageView;

@end

#define kAvatarTopHeight ([UIScreen mainScreen].bounds.size.height == 812 ? 91 : 67)


@implementation LRRMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    weakSelf(self);
    [self addSubview:self.headerImageView];
    [self.headerImageView addSubview:self.avatarImageView];
    [self.headerImageView addSubview:self.nameLabel];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.headerImageView.mas_left).offset(15);
        make.top.equalTo(weakself.headerImageView.mas_top).offset(kAvatarTopHeight);
        make.width.height.equalTo(@(57));
        make.height.height.equalTo(@(57));
    }];
    
//    self.nameLabel.text = @"西门吹雪";
    if (![LRRUserManager sharedUserManager].logined) {
        self.nameLabel.text = @"点击登录";
    }else{
        self.nameLabel.text = [LRRUserManager sharedUserManager].currentUser.nickname;
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[LRRUserManager sharedUserManager].currentUser.avatarUrl] placeholderImage:[UIImage imageNamed:@"pic_touxiang"]];
    }
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.avatarImageView.mas_centerY);
        make.left.equalTo(weakself.avatarImageView.mas_right).offset(20);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    [self.headerImageView addGestureRecognizer:tap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(headerViewTapMessage)]) {
        [self.delegate headerViewTapMessage];
    }
}

#pragma mark - 懒加载
- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _headerImageView.image = [UIImage imageNamed:@"bg"];
        _headerImageView.userInteractionEnabled = YES;
    }
    return _headerImageView;
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.image = [UIImage imageNamed:@"pic_touxiang"];
        _avatarImageView.layer.cornerRadius = 5.f;
        _avatarImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _avatarImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = UIColorHex(0xffffff);
        if (@available(iOS 8.2, *)) {
            _nameLabel.font = LRRMediumFont(16);
        } else {
            // Fallback on earlier versions
        }
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}
@end
