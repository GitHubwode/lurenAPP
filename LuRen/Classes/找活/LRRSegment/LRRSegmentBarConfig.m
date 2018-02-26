//
//  LRRSegmentBarConfig.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSegmentBarConfig.h"

@implementation LRRSegmentBarConfig

+ (instancetype)defaultConfig
{
    LRRSegmentBarConfig *config = [[LRRSegmentBarConfig alloc]init];
    config.lRBackColor = [UIColor clearColor];
    if (@available(iOS 8.2, *)) {
        config.itemF = LRRMediumFont(17);
    } else {
        // Fallback on earlier versions
    }
    config.itemNC = [UIColor lightGrayColor];
    config.itemSC = [UIColor redColor];
    config.indicatorC = [UIColor redColor];
    config.indicatorH = 0;
    config.indicatorW = 0;
    return config;
}

- (LRRSegmentBarConfig *(^)(UIColor *))segmentBarBackColor
{
    return ^(UIColor *color){
        self.lRBackColor = color;
        return self;
    };
}

- (LRRSegmentBarConfig *(^)(UIFont *))itemFont{
    return ^(UIFont *font){
        self.itemF = font;
        return self;
    };
}

- (LRRSegmentBarConfig *(^)(UIColor *))itemNormalColor{
    return ^(UIColor *color){
        self.itemNC = color;
        return self;
    };
}

- (LRRSegmentBarConfig *(^)(UIColor *))itemSelectColor{
    return ^(UIColor *color){
        self.itemSC = color;
        return self;
    };
}

- (LRRSegmentBarConfig *(^)(UIColor *))indicatorColor{
    return ^(UIColor *color){
        self.indicatorC = color;
        return self;
    };
}

- (LRRSegmentBarConfig *(^)(CGFloat))indicatorHeight{
    return ^(CGFloat H){
        self.indicatorH = H;
        return self;
    };
}

- (LRRSegmentBarConfig *(^)(CGFloat))indicatorExtraW{
    return ^(CGFloat W){
        self.indicatorW = W;
        return self;
    };
}

@end
