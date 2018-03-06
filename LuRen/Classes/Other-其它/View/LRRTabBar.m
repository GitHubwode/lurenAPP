//
//  LRRTabBar.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRTabBar.h"
#import "LRRTabBarBigButton.h"
#import "LRRTabBarButton.h"
#import "LRRBaseTabBarController.h"

@interface LRRTabBar ()

/**
 *  选中的按钮
 */
@property (nonatomic, weak) UIButton *selButton;
/** bigButton */
@property (nonatomic, weak) LRRTabBarBigButton *bigButton;
/** 需要选中第几个 */
@property (nonatomic, assign) NSUInteger currentSelectedIndex;

@end

@implementation LRRTabBar

static NSInteger const LRRTabBarTag = 12000;

- (void)setItems:(NSArray *)items
{
    _items = items;
    //UITabBarItem保存按钮上的图片
    for (int i =0 ; i<items.count; i++) {
        UITabBarItem *item = items[i];
        if (i == 2) {
            LRRTabBarBigButton *btn = [LRRTabBarBigButton buttonWithType:UIButtonTypeCustom];
            
            btn.tag = self.subviews.count + LRRTabBarTag;
            
            //设置图片
            [btn setImage:item.image forState:UIControlStateNormal];
            [btn setImage:item.selectedImage forState:UIControlStateSelected];
            btn.adjustsImageWhenHighlighted = NO;
            //设置文字
            [btn setTitle:item.title forState:UIControlStateNormal];
            [btn setTitleColor:UIColorHex(666666) forState:UIControlStateNormal];
            [btn setTitleColor:LRROrangeThemeColor forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:btn];
            self.bigButton = btn;
        }else{
            LRRTabBarButton *btn = [LRRTabBarButton buttonWithType:UIButtonTypeCustom];
            btn.tag = self.subviews.count + LRRTabBarTag;
            

            // 设置图片
            [btn setImage:item.image forState:UIControlStateNormal];
            [btn setImage:item.selectedImage forState:UIControlStateSelected];
            btn.adjustsImageWhenHighlighted = NO;
            // 设置文字
            [btn setTitle:item.title forState:UIControlStateNormal];
            btn.item = item;
            [btn setTitleColor:UIColorHex(666666) forState:UIControlStateNormal];
            [btn setTitleColor:LRROrangeThemeColor forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            
            [self addSubview:btn];
            //子空间个数
            NSInteger subViewsCount = 1;
            if (self.seletedIndex) {
                subViewsCount = self.seletedIndex + 1;
            }
            
            if (self.subviews.count == subViewsCount) {
                self.currentSelectedIndex = self.subviews.count - 1;
                //默认选中第一个
                [self btnClick:btn];
            }
            //观察者
            [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(btn)];
            
        }
    }
}

- (void)dealloc
{
    for (int i =0; i<self.items.count; i++) {
        if (i != 2) {
            [self.items[i] removeObserver:self forKeyPath:@"badgeValue"];
        }
    }
}

/**
 *  实现数字的显示
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    LRRTabBarButton *btn = (__bridge LRRTabBarButton *)(context);
    UITabBarItem *item = object;
    btn.item = item;
}

- (void)setDelegate:(id<LRRTabBarDelegate>)delegate{
    _delegate = delegate;
    [self btnClick:(LRRTabBarButton *)[self viewWithTag:self.currentSelectedIndex + LRRTabBarTag]];
}

- (void)btnClick:(UIButton *)button
{
    _selButton.selected = NO;
    button.selected = YES;
    _selButton = button;
    // 通知tabBarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:button.tag - LRRTabBarTag];
    }
}

/**
 *  外界设置索引页跟着跳转
 */
- (void)setSeletedIndex:(NSInteger)seletedIndex {
    _seletedIndex = seletedIndex;
    UIButton *button = [self viewWithTag:(LRRTabBarTag + seletedIndex)];
    [self btnClick:button];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width / count;
    
    CGFloat h = 49;
#warning 在这里修改位置
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        
        x = i * w;
        
        if (i == 2) {
            y = -12;
            h += 12;
        }
        btn.frame = CGRectMake(x, y, w, h);
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 这里宽度应该跟突出部分的宽度一样，减少点击反应区域
    CGFloat pointW = 43;
    CGFloat pointH = 61;
    CGFloat pointX = (kMainScreenWidth - pointW) / 2;
    CGFloat pointY = -12;
    CGRect rect = CGRectMake(pointX, pointY, pointW, pointH);
    if (CGRectContainsPoint(rect, point)) {
        return self.bigButton;
    }
    return [super hitTest:point withEvent:event];
}


@end
