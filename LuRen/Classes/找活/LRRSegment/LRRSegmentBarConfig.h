//
//  LRRSegmentBarConfig.h
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LRRSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;

@property (nonatomic, strong) UIColor *lRBackColor;
@property (nonatomic, strong) UIColor *itemNC;
@property (nonatomic, strong) UIColor *itemSC;
@property (nonatomic, strong) UIFont *itemF;
@property (nonatomic, strong) UIColor *indicatorC;
@property (nonatomic, assign) CGFloat indicatorH;
@property (nonatomic, assign) CGFloat indicatorW;


/**默认颜色*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^itemNormalColor)(UIColor *color);
/**选中颜色*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^itemSelectColor)(UIColor *color);
/**背景颜色*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^segmentBarBackColor)(UIColor *color);
/**文字字体大小*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^itemFont)(UIFont *font);
/**指示器颜色*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^indicatorColor)(UIColor *color);
/**指示器高度*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^indicatorHeight)(CGFloat h);
/**指示器宽度*/
@property (nonatomic, copy, readonly) LRRSegmentBarConfig *(^indicatorExtraW)(CGFloat w);

@end
