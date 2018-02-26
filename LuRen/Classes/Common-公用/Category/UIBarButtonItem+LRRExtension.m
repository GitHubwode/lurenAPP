//
//  UIBarButtonItem+LRRExtension.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "UIBarButtonItem+LRRExtension.h"

@implementation UIBarButtonItem (LRRExtension)

/**
 快速创建一个UIBarButtonItem模型对象
 
 @param image 普通状态的图片
 @param highImage 高亮状态的图片
 @param target 事件对象
 @param action 事件对象的方法
 @return UIBarButtonItem模型对象
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage Title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (@available(iOS 8.2, *)) {
        button.titleLabel.font = LRRLightFont(15);
    } else {
        // Fallback on earlier versions
    }
    [button setTitleColor:LRRTitleTextColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}


+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (@available(iOS 8.2, *)) {
        button.titleLabel.font = LRRLightFont(15);
    } else {
        // Fallback on earlier versions
    }
    [button setTitleColor:LRRItemSeletedColor forState:UIControlStateDisabled];
    [button setTitleColor:LRRTitleTextColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithButtonTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = LRRFont(15);
    [button setTitleColor:LRRTitleTextColor forState:UIControlStateDisabled];
    [button setTitleColor:LRROrangeThemeColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    return [[self alloc] initWithCustomView:button];
    
}

@end
