//
//  LRRTabBar.h
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRRTabBar;

@protocol LRRTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LRRTabBar *)tabBar didClickBtn:(NSInteger)index;

@end

@interface LRRTabBar : UIView

/** 选中的索引 */
@property (nonatomic, assign) NSInteger seletedIndex;

// 模型数组(UITabBarItem)
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<LRRTabBarDelegate> delegate;

@end
