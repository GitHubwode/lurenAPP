//
//  LRRSegmentBar.h
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRSegmentBarConfig.h"


@class LRRSegmentBar;

@protocol LRRSegmentBarDelegate <NSObject>

/**
 通知外界内部的点击数据
 
 @param segmentBar segmentBar
 @param toIndex 选中的索引从0 开始
 @param fromIndex 上一个索引
 */
- (void)segmentBar:(LRRSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;


@end

@interface LRRSegmentBar : UIView

/**
 快速创建一个选项卡控件
 
 @param frame frame
 @return segment
 */
+ (instancetype)segmentBarWithFrame:(CGRect)frame;
//代理
@property (nonatomic, weak) id<LRRSegmentBarDelegate> delegate;
/** 数据源 */
@property (nonatomic, strong) NSArray <NSString *>*items;
/** 当前选中索引,双向设置 */
@property (nonatomic, assign) NSInteger selectIndex;

- (void)updataWithConfig:(void(^)(LRRSegmentBarConfig *config))configBlock;

@end

