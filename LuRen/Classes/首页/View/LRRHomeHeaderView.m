//
//  LRRHomeHeaderView.m
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeHeaderView.h"
#import "SDCycleScrollView.h"
#import "LRRSlideShowModel.h"

static NSString *HomeFirstCollectionReusableViewIdfy = @"HomeFirstCollectionReusableViewIdfy";

static CGFloat headerBtnHeight = 30.f;

@interface LRRHomeHeaderView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *recomLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UILabel *titleLabel1;
@property (nonatomic, strong) UIButton *moreButton1;

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

+ (NSString *)identifier
{
    return HomeFirstCollectionReusableViewIdfy;
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
        make.height.equalTo(@(headerBtnHeight));
    }];
    
    
    UIView *topView1 = [UIView new];
    topView1.backgroundColor = LRRViewBackgroundColor;
    [self addSubview:topView1];
    
    [topView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bottomView.mas_bottom);
        make.left.equalTo(weakself.mas_left);
        make.width.equalTo(@(kMainScreenWidth));
        make.height.equalTo(@(10));
    }];
    
    UIView *bottomView1 = [UIView new];
    bottomView1.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView1];
    
    [bottomView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView1.mas_bottom);
        make.left.equalTo(topView1.mas_left);
        make.width.equalTo(@(kMainScreenWidth));
        make.height.equalTo(@(40));
    }];
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = UIColorHex(0xf34b00);
    [bottomView1 addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView1.mas_centerY);
        make.left.equalTo(bottomView1.mas_left).offset(LRRLeftPadding);
        make.width.equalTo(@(7));
        make.height.equalTo(@(20));
    }];
    
    [bottomView1 addSubview:self.titleLabel1];
    [bottomView1 addSubview:self.moreButton1];
    [self.titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView1.mas_centerY);
        make.left.equalTo(lineView1.mas_right).offset(11);
    }];
    
    [self.moreButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView1.mas_centerY);
        make.right.equalTo(bottomView1.mas_right).offset(-LRRRightPadding);
        make.width.equalTo(@(headerBtnHeight));
        make.height.equalTo(@(headerBtnHeight));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.bottomView.mas_left).offset(13);
        make.width.equalTo(@(40));
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.titleLabel.mas_right).offset(2);
        make.width.equalTo(@(40));
    }];
    
    [self.recomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.left.equalTo(weakself.imageView.mas_right).offset(10);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.bottomView.mas_centerY);
        make.right.equalTo(weakself.bottomView.mas_right).offset(-14);
        make.width.equalTo(@(50));
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
}

- (void)homeHeaderViewImage:(NSMutableArray *)array
{
    NSMutableArray *imagesURLStrings = [NSMutableArray array];
    for (LRRSlideShowModel *model in array) {
        [imagesURLStrings addObject:model.url];
    }
    LRRLog(@"%@",imagesURLStrings);
    self.cycleView.imageURLStringsGroup = imagesURLStrings;
}

#pragma mark - 按钮的点击事件

- (void)moreFirstButtonAction:(UIButton *)sender
{
    if ([self.firstDelegate respondsToSelector:@selector(selectedFirstButtonClick:)]) {
        [self.firstDelegate selectedFirstButtonClick:sender];
    }
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
        _titleLabel.text = @"居工";
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
        _messageLabel.text = @"网工宝APP上线了,免费的用工软件";
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
        _moreButton.tag = 1000;
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton setTitleColor:UIColorHex(0X333333) forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(moreFirstButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (SDCycleScrollView *)cycleView
{
    if (!_cycleView) {
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kMainScreenWidth, 142) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _cycleView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleView.backgroundColor = LRRViewBackgroundColor;
    }
    return _cycleView;
}

- (UILabel *)titleLabel1
{
    if (!_titleLabel1) {
        _titleLabel1 = [UILabel new];
        _titleLabel1.text = @"优秀老板/工头展示";
        _titleLabel1.font = LRRFont(14);
        _titleLabel1.textColor = UIColorHex(0x444444);
        _titleLabel1.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel1;
}
- (UIButton *)moreButton1
{
    if (!_moreButton1) {
        _moreButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton1.titleLabel.font = LRRFont(12);
        _moreButton1.tag = 1001;
        [_moreButton1 setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton1 setTitleColor:UIColorHex(0X333333) forState:UIControlStateNormal];
        [_moreButton1 addTarget:self action:@selector(moreFirstButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton1;
}


@end
