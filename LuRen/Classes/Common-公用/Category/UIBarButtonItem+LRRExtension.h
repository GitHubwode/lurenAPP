//
//  UIBarButtonItem+LRRExtension.h
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LRRExtension)

/**
 快速创建一个UIBarButtonItem模型对象
 
 @param image 普通状态的图片
 @param highImage 高亮状态的图片
 @param target 事件对象
 @param action 事件对象的方法
 @return UIBarButtonItem模型对象
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage Title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithButtonTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
