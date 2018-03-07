//
//  LRRServiceCenterHeaderView.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRServiceCenterHeaderView.h"
#import "NSBundle+LRRExtension.h"

@interface LRRServiceCenterHeaderView()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *versionLabel;

@end

@implementation LRRServiceCenterHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self creatView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView
{
    NSString *curVersion = [NSBundle currentVersion];

    weakSelf(self);
    [self addSubview:self.imageView];
    [self addSubview:self.versionLabel];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.mas_centerX);
        make.top.equalTo(weakself.mas_top).offset(33);
    }];
    self.versionLabel.text = [NSString stringWithFormat:@"版本 %@",curVersion];
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.mas_centerX);
        make.top.equalTo(weakself.imageView.mas_bottom).offset(22);
    }];
}

- (UILabel *)versionLabel
{
    if (!_versionLabel) {
        _versionLabel = [UILabel new];
        _versionLabel.font = LRRFont(16);
        _versionLabel.textColor = UIColorHex(0x444444);
    }
    return _versionLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"logo_me"];
    }
    return _imageView;
}


@end
