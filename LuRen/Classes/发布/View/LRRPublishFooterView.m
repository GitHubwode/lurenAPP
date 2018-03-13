//
//  LRRPublishFooterView.m
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishFooterView.h"

@interface LRRPublishFooterView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation LRRPublishFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
    UIView *bgView = [UIView new];
    bgView.backgroundColor = UIColorHex(0xf1f1f1);
    [self addSubview:bgView];
    [bgView addSubview:self.titleLabel];
    [bgView addSubview:self.subTitleLabel];
    [bgView addSubview:self.imageView];
    [self addSubview:self.publishButton];
    weakSelf(self);
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.mas_centerX);
        make.top.equalTo(weakself.mas_top).offset(5);
        make.width.equalTo(@(kMainScreenWidth-2*LRRLeftPadding));
        make.height.equalTo(@(84));
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(13);
        make.top.equalTo(bgView.mas_top).offset(10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.imageView.mas_centerY);
        make.left.equalTo(weakself.imageView.mas_right).offset(12);
    }];
    
    [UILabel changeLineSpaceForLabel:self.subTitleLabel WithSpace:5.f];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakself.imageView.mas_leading);
        make.top.equalTo(weakself.imageView.mas_bottom).offset(15);
        make.right.equalTo(bgView.mas_right).offset(-13);
//        make.height.equalTo(@(30));
    }];
    
    [self.publishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.mas_centerX);
        make.bottom.equalTo(weakself.mas_bottom).offset(-23);
        make.height.equalTo(@(45.f));
        make.width.equalTo(@(LRRAdaptedWidth(247.f)));
    }];

}

#pragma mark - 按钮的点击事件

- (void)publishButtonClick:(UIButton *)sender
{
    if ([self.footerDelegate respondsToSelector:@selector(ensurePublshButtonClicked)]) {
        [self.footerDelegate ensurePublshButtonClicked];
    }
}

#pragma mark - 懒加载
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"icon_renpin"];
    }
    return _imageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"风险提示:";
        _titleLabel.font = LRRFont(14);
        _titleLabel.textColor = UIColorHex(0x444444);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel new];
        _subTitleLabel.text = @"如接单后跑单对用工方造成损失的，将追究法律责任，并赔偿用工方损失。若信息不实请举报，举报电话:0571-88730997";
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.font = LRRFont(10);
        _subTitleLabel.textColor = UIColorHex(0x777777);
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _subTitleLabel;
}

- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setTitleColor:UIColorHex(0xffffff) forState:UIControlStateNormal];
        [_publishButton setTitle:@"发布" forState:UIControlStateNormal];
        _publishButton.titleLabel.font = LRRFont(15);
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"icon_btn"] forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(publishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishButton;
}


@end
