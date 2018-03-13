//
//  UIView+LRRHUD.h
//  LuRen
//
//  Created by Ding on 2018/3/13.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LRRHUD)

/**
 在当前view上显示一个HUD
 */
- (void)showHUD;

/**
 移除当前view上的HUD
 */
- (void)hideHUD;

/**
 在当前view上显示一个带有图片和文字的HUD
 图片名为空时，只显示文字
 
 @param hint 文字
 @param image 图片
 */
- (void)showHint:(NSString *)hint image:(NSString *)image;

/**
 在当前view上显示一个带文字的HUD
 
 @param hint 文字
 */
- (void)showHint:(NSString *)hint;

// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen;

@end
