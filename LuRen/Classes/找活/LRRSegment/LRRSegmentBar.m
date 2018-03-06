//
//  LRRSegmentBar.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSegmentBar.h"

@interface LRRSegmentBar ()

/** 内容承载视图 */
//@property (nonatomic, weak) UIScrollView *contentView;
/** 添加的按钮数据 */
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;
/** 指示器 */
@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic, strong) LRRSegmentBarConfig *config;


@end

@implementation LRRSegmentBar{
    //记录最后一次点击的按钮
    UIButton *_lastBtn;
}

+ (instancetype)segmentBarWithFrame:(CGRect)frame
{
    LRRSegmentBar *segmentBar = [[LRRSegmentBar alloc]init];
    return segmentBar;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = self.config.lRBackColor;
    }
    return self;
}

- (void)updataWithConfig:(void (^)(LRRSegmentBarConfig *))configBlock
{
    if (configBlock) {
        configBlock(self.config);
    }
    //按照当前的self.config 进行刷新
    self.backgroundColor = self.config.lRBackColor;
    self.indicatorView.backgroundColor = self.config.indicatorC;
    for (UIButton *btn in self.itemBtns) {
        [btn setTitleColor:self.config.itemNC forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSC forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemF;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    if (self.items.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
}

- (void)setItems:(NSArray<NSString *> *)items
{
    _items = items;
    //删除之前添加过多的组建
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    
    //根据所有的选项数据源 创建BUtton 添加到内容视图上
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = self.itemBtns.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:self.config.itemNC forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSC forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"exitButtonBg"] forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemF;
        [btn setTitle:item forState:UIControlStateNormal];
        [self addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - private
- (void)btnClick:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:sender.tag fromIndex:_lastBtn.tag];
    }
    
    _selectIndex = sender.tag;
    _lastBtn.selected = NO;
    sender.selected = YES;
    _lastBtn = sender;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.dl_width = sender.dl_width + self.config.indicatorW * 2;
        self.indicatorView.dl_centerX = sender.dl_centerX;
    }];
}

#pragma mark - layout
- (void)layoutSubviews{
    [super layoutSubviews];
    UIButton *btn = self.itemBtns[0];
    UIButton *btn1 = self.itemBtns[1];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(@(55));
        make.height.equalTo(@(29));
    }];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(@(55));
        make.height.equalTo(@(29));
    }];
    
    if (self.itemBtns.count == 0) {
        return;
    }
}

#pragma mark - lazy-init
- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = self.config.indicatorH;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.dl_height - indicatorH, 0, indicatorH)];
        indicatorView.layer.masksToBounds = YES;
        indicatorView.layer.cornerRadius = 10.f;
        indicatorView.backgroundColor = self.config.indicatorC;
        //        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

//- (UIScrollView *)contentView {
//    if (!_contentView) {
//        UIScrollView *scrollView = [[UIScrollView alloc] init];
//        scrollView.showsHorizontalScrollIndicator = NO;
//        [self addSubview:scrollView];
//        _contentView = scrollView;
//    }
//    return _contentView;
//}

- (LRRSegmentBarConfig *)config{
    if (!_config) {
        _config = [LRRSegmentBarConfig defaultConfig];
    }
    return _config;
}

@end

