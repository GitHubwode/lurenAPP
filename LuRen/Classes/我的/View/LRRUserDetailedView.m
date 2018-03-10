//
//  LRRUserDetailedView.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRUserDetailedView.h"

@interface  LRRUserDetailedView ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *typeImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *workTypeLabel;
@property (nonatomic, strong) UILabel *workAgeLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *teamLabel;
@property (nonatomic, strong) UILabel *workTypeNameLabel;
@property (nonatomic, strong) UILabel *workAgeNumLabel;
@property (nonatomic, strong) UILabel *cityNameLabel;
@property (nonatomic, strong) UILabel *teamNumLabel;
@property (nonatomic, strong) UIButton *focusButton;

@end

@implementation LRRUserDetailedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatMessageLabel];
        [self creatUIView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self creatMessageLabel];
    [self creatUIView];
}

- (void)creatMessageLabel
{
    self.backgroundColor = UIColorHex(0xffffff);
    [self addSubview:self.avatarImageView];
    [self addSubview:self.typeImageView];
    self.nameLabel = [self creatUserDetailedMessageText:@"左雷婵" Font:15.f TextColor:UIColorHex(0x444444)];
    self.subTitleLabel = [self creatUserDetailedMessageText:@"男  汉族  26岁" Font:14.f TextColor:UIColorHex(0x777777)];
    //工种
    self.workTypeLabel = [self creatUserDetailedMessageText:@"工种:" Font:14.f TextColor:UIColorHex(0x444444)];
    self.workTypeNameLabel = [self creatUserDetailedMessageText:@"木工" Font:14.f TextColor:UIColorHex(0x777777)];
    //工龄
    self.workAgeLabel = [self creatUserDetailedMessageText:@"工龄:" Font:14.f TextColor:UIColorHex(0x444444)];
    self.workAgeNumLabel = [self creatUserDetailedMessageText:@"2年" Font:14.f TextColor:UIColorHex(0x777777)];
    //籍贯
    self.cityLabel = [self creatUserDetailedMessageText:@"籍贯:" Font:14.f TextColor:UIColorHex(0x444444)];
    self.cityNameLabel = [self creatUserDetailedMessageText:@"湖北" Font:14.f TextColor:UIColorHex(0x777777)];
    //团队规模
    self.teamLabel = [self creatUserDetailedMessageText:@"团队规模:" Font:14.f TextColor:UIColorHex(0x444444)];
    self.teamNumLabel = [self creatUserDetailedMessageText:@"20人" Font:14.f TextColor:UIColorHex(0x777777)];
}


- (void)creatUIView
{
    weakSelf(self);
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 10)];
    topView.backgroundColor = LRRViewBackgroundColor;
    [self addSubview:topView];
    [self addSubview:self.avatarImageView];
    [self addSubview:self.typeImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.subTitleLabel];
    [self addSubview:self.workTypeLabel];
    [self addSubview:self.workTypeNameLabel];
    [self addSubview:self.workAgeLabel];
    [self addSubview:self.workAgeNumLabel];
    [self addSubview:self.cityLabel];
    [self addSubview:self.cityNameLabel];
    [self addSubview:self.teamLabel];
    [self addSubview:self.teamNumLabel];
    [self addSubview:self.focusButton];
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).offset(20);
        make.left.equalTo(weakself.mas_left).offset(LRRLeftPadding);
        make.width.equalTo(@(49));
        make.height.equalTo(@(49));
    }];
    
    [self.focusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.avatarImageView.mas_centerY);
        make.right.equalTo(weakself.mas_right).offset(-LRRRightPadding);
        make.width.equalTo(@(46));
        make.height.equalTo(@(29));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(weakself.avatarImageView.mas_topMargin).offset(2);
        make.left.equalTo(weakself.avatarImageView.mas_right).offset(11);
    }];
    
    [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.nameLabel.mas_centerY);
        make.left.equalTo(weakself.nameLabel.mas_right).offset(12);
        make.width.equalTo(@(66));
        make.height.equalTo(@(15));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottomMargin.equalTo(weakself.avatarImageView.mas_bottomMargin).offset(-2);
        make.leading.equalTo(weakself.nameLabel.mas_leading);
    }];
    
    [self.workTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakself.avatarImageView.mas_leading);
        make.top.equalTo(weakself.avatarImageView.mas_bottom).offset(22);
    }];
    [self.workTypeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.workTypeLabel.mas_centerY);
        make.left.equalTo(weakself.workTypeLabel.mas_right).offset(5);
    }];
    
    [self.workAgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakself.workTypeLabel.mas_leading);
        make.top.equalTo(weakself.workTypeLabel.mas_bottom).offset(22);
    }];
    [self.workAgeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.workAgeLabel.mas_centerY);
        make.left.equalTo(weakself.workAgeLabel.mas_right).offset(5);
    }];
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakself.workAgeLabel.mas_leading);
        make.top.equalTo(weakself.workAgeLabel.mas_bottom).offset(22);
    }];
    [self.cityNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.cityLabel.mas_centerY);
        make.left.equalTo(weakself.cityLabel.mas_right).offset(5);
    }];
    
    [self.teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakself.cityLabel.mas_leading);
        make.top.equalTo(weakself.cityLabel.mas_bottom).offset(22);
    }];
    [self.teamNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.teamLabel.mas_centerY);
        make.left.equalTo(weakself.teamLabel.mas_right).offset(5);
    }];
    
}

- (void)forusOnButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    LRRLog(@"关注");
}

- (UILabel *)creatUserDetailedMessageText:(NSString *)text Font:( CGFloat )font TextColor:(UIColor *)color
{
    UILabel *label = [UILabel new];
    label.font = LRRFont(font);
    label.text = text;
    label.textColor = color;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 5.f;
        _avatarImageView.image = [UIImage imageNamed:@"pic_touxiang"];
    }
    return _avatarImageView;
}

- (UIImageView *)typeImageView
{
    if (!_typeImageView) {
        _typeImageView = [[UIImageView alloc]init];
        _typeImageView.image = [UIImage imageNamed:@"information_bth_realname"];
    }
    return _typeImageView;
}

- (UIButton *)focusButton
{
    if (!_focusButton) {
        _focusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _focusButton.adjustsImageWhenHighlighted = NO;
        [_focusButton setBackgroundImage:[UIImage imageNamed:@"use_icon_heart"] forState:UIControlStateNormal];
        [_focusButton setBackgroundImage:[UIImage imageNamed:@"use_icon_heart_pressed"] forState:UIControlStateSelected];
        [_focusButton addTarget:self action:@selector(forusOnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _focusButton;
}


@end
