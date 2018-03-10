//
//  WMTabControl.h
//
//  Created by zwm on 15-5-26.
//  Copyright (c) 2015年 zwm. All rights reserved.
//

#import <UIKit/UIKit.h>

// 选中时出现底线的颜色，
#define kLineColor UIColorHex(444444)
// 底线高度
#define kLineHeight (0)
// 底线左右间隔
#define kHspace (0)

// 分割线颜色
#define kHLineColor UIColorHex(f1f1f1)
// 垂直分割线上下间隔
#define kVerticalLineSpace (5)
// 水平分割线高度
#define kHorizontalLineH (1)

// 文本常态颜色
#define kTextColor UIColorHex(444444)
// 文本选中颜色
#define kTextSelectColor UIColorHex(ec6b1a)
// 文本字体
#define kTextFont (15)
// 右边icon间隔
#define kIconSpace (4)
// 右边icon宽高
#define kIconW (12)
#define kIconH (7)
// 右边icon选中图
#define kIconSelect [UIImage imageNamed:@"find_icon_up"]
// 右边icon常态图
#define kIconNomal  [UIImage imageNamed:@"find_icon_down"]
// 动画时长
#define kAnimationTime (0.3)

typedef void (^WMTabControlBlock)(NSInteger index);

@class WMTabControl;
@protocol WMTabControlDelegate <NSObject>
- (void)control:(WMTabControl *)control selectedIndex:(NSInteger)index;
@end

@interface WMTabControl : UIView

@property (nonatomic, assign, readonly) NSInteger currentIndex;
@property (nonatomic, copy) id<WMTabControlDelegate> delegate;

- (void)setItemsWithTitleArray:(NSArray *)titleArray
                 selectedBlock:(WMTabControlBlock)block;

- (void)setTitle:(NSString *)title withIndex:(NSInteger)index;

- (void)selectIndex:(NSInteger)index;

@end
