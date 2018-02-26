//
//  LRRHomeHeaderView.m
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeHeaderView.h"
#import "SDCycleScrollView.h"


@interface LRRHomeHeaderView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *recomLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation LRRHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        self.backgroundColor = LRRViewBackgroundColor;
    }
    return self;
}

- (void)setUp
{
    weakSelf(self);
    [self addSubview:self.topView];
    [self addSubview:self.bottomView];
    [self.topView addSubview:self.cycleView];
    [self.bottomView addSubview:self.titleLabel];
    [self.bottomView addSubview:self.imageView];
    [self.bottomView addSubview:self.recomLabel];
    [self.bottomView addSubview:self.messageLabel];
    [self.bottomView addSubview:self.moreButton];
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorHex(0xf34b00);
    [self.bottomView addSubview:lineView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top);
        make.left.equalTo(weakself.mas_left);
        make.width.equalTo(weakself.mas_width);
        make.height.equalTo(@(142));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).offset(10);
        make.right.equalTo(weakself.mas_right).offset(-10);
        make.top.equalTo(weakself.topView.mas_bottom).offset(10);
        make.bottom.equalTo(weakself.mas_bottom);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.bottomView.mas_left).offset(13);
        
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.titleLabel.mas_right).offset(2);
    }];
    
    [self.recomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.imageView.mas_right).offset(10);
    }];
    
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.right.equalTo(weakself.bottomView.mas_right).offset(-14);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.right.equalTo(weakself.moreButton.mas_left).offset(-3);
        make.width.equalTo(@(3));
        make.height.equalTo(@(18));
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.recomLabel.mas_right).offset(8);
        make.right.equalTo(lineView.mas_left).offset(-8);
    }];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    self.cycleView.imageURLStringsGroup = imagesURLStrings;
}

#pragma mark - 按钮的点击事件
- (void)moreButtonAction:(UIButton *)sender
{
    LRRLog(@"按钮的更多");
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    LRRLog(@"轮播图");
}

#pragma mark - 懒加载
- (UIView *)topView
{
    if (!_topView) {
        _topView = [UIView new];
    }
    return _topView;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.layer.masksToBounds = YES;
        _bottomView.layer.cornerRadius = 15.f;
        _bottomView.backgroundColor = UIColorHex(0xffffff);
    }
    return _bottomView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"陆人";
        _titleLabel.font = LRRFont(15);
        _titleLabel.textColor = UIColorHex(0x333333);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"pic_kuaibao"];
    }
    return _imageView;
}
- (UILabel *)recomLabel
{
    if (!_recomLabel) {
        _recomLabel = [UILabel new];
        _recomLabel.text = @"推荐";
        _recomLabel.font = LRRFont(12);
        _recomLabel.textColor = LRRMoneyTitleColor;
        _recomLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _recomLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.text = @"陆人老周又去大保健,结果被警察抓住了";
        _messageLabel.font = LRRFont(12);
        _messageLabel.textColor = LRRTimeTextColor;
        _messageLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _messageLabel;
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

- (SDCycleScrollView *)cycleView
{
    if (!_cycleView) {
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kMainScreenWidth, 142) delegate:self placeholderImage:[UIImage imageNamed:@"pic_lunbo1"]];
        _cycleView.backgroundColor = LRRViewBackgroundColor;
//        _cycleView.currentPageDotImage = [UIImage imageNamed:@""];
//        _cycleView.pageDotImage = [UIImage imageNamed:@""];
    }
    return _cycleView;
}



@end
