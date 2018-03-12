//
//  LRRCustomInfoItem.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRRCustomInfoItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
/** 单位名称 */
@property (nonatomic, strong) NSString *unitTitle;
/** 能输入的文字的最多个数 */
@property (nonatomic, assign) NSUInteger maxTextLength;
/** 键盘类型 */
@property (nonatomic, assign) UIKeyboardType keyboardType;
/** 占位文字 */
@property (nonatomic, strong) NSString *placeholder;
/** 是否是必填项 */
@property (nonatomic, assign) BOOL required;
/** 对应的属性值 */
@property (nonatomic, copy) NSString *propertyKey;
/** 是否cell能够响应点击事件 */
@property (nonatomic, assign) BOOL enabled;
/** 是否在当前页面能够编辑 */
@property (nonatomic, assign) BOOL editabled;
/** 是否隐藏右边的指示器 */
@property (nonatomic, assign) BOOL hidenIndicator;
/** 是否隐藏下面的分割线 */
@property (nonatomic, assign) BOOL hidenLine;
@property (nonatomic, assign) CGFloat cellHeight;

@end
