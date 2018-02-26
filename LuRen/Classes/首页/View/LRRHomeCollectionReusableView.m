//
//  LRRHomeCollectionReusableView.m
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeCollectionReusableView.h"

static NSString *HomeCollectionReusableViewIdfy = @"HomeCollectionReusableViewIdfy";

@interface LRRHomeCollectionReusableView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation LRRHomeCollectionReusableView

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
    UIView *topView = [UIView new];
    topView.backgroundColor = LRRViewBackgroundColor;
    [self addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top);
        make.left.equalTo(weakself.mas_left);
        make.width.equalTo(@(kMainScreenWidth));
        make.height.equalTo(@(10));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom);
        make.left.equalTo(topView.mas_left);
        make.width.equalTo(@(kMainScreenWidth));
        make.height.equalTo(@(40));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorHex(0xf34b00);
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView.mas_centerY);
        make.left.equalTo(bottomView.mas_left).offset(15);
        make.width.equalTo(@(7));
        make.height.equalTo(@(20));
    }];
    
    [bottomView addSubview:self.titleLabel];
    [bottomView addSubview:self.moreButton];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView.mas_centerY);
        make.left.equalTo(lineView.mas_right).offset(11);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView.mas_centerY);
        make.right.equalTo(bottomView.mas_right).offset(-15);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
}

#pragma mark - 点击更多
- (void)moreButtonAction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(selectedButtonClick:)]) {
        [self.delegate selectedButtonClick:sender];
    }
}

+ (NSString *)identifier
{
    return HomeCollectionReusableViewIdfy;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"优秀老板/工头展示";
        _titleLabel.font = LRRFont(14);
        _titleLabel.textColor = UIColorHex(0x444444);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}
- (UIButton *)moreButton
{
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.titleLabel.font = LRRFont(12);
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton setTitleColor:UIColorHex(0X333333) forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(moreButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

@end
