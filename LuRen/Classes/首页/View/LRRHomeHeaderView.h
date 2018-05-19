//
//  LRRHomeHeaderView.h
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDCycleScrollView;

@protocol LRRHomeFirstCollectionReusableViewDelegate <NSObject>

- (void)selectedFirstButtonClick:(UIButton *)sender;

@end

@interface LRRHomeHeaderView : UICollectionReusableView

@property (nonatomic, strong) SDCycleScrollView *cycleView;
@property (nonatomic, weak) id <LRRHomeFirstCollectionReusableViewDelegate> firstDelegate;

- (void)homeHeaderViewImage:(NSMutableArray *)array;

+ (NSString *)identifier;

@end
