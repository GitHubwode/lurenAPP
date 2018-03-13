//
//  MBProgressHUD+LRRExtension.h
//  LuRen
//
//  Created by Ding on 2018/3/13.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LRRExtension)

/**
 快速显示一个错误信息
 
 @param error 错误信息
 @param view 要显示在的View，nil代表显示在最上层的Window上，不一定是KeyWindow
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;

/**
 快速显示一个错误信息
 
 @param success 错误信息
 @param view 要显示在的View，nil代表显示在最上层的Window上，不一定是KeyWindow
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 快速显示一个信息
 
 @param message 信息
 @param view 要显示在的View，nil代表显示在最上层的Window上，不一定是KeyWindow
 */
+ (void)showMessag:(NSString *)message toView:(UIView *)view;

/**
 快速显示一个信息在最上层的Window上
 
 @param message 信息
 */
+ (void)showMessag:(NSString *)message;


/**
 快速显示一个错误信息
 
 @param success 错误信息
 @param view 要显示在的View，nil代表显示在最上层的Window上，不一定是KeyWindow
 */
+ (void)showSuYaSuccess:(NSString *)success toView:(UIView *)view;

/**
 快速显示一个错误信息
 
 @param error 错误信息
 @param view 要显示在的View，nil代表显示在最上层的Window上，不一定是KeyWindow
 */
+ (void)showSuYaError:(NSString *)error toView:(UIView *)view;

@end
