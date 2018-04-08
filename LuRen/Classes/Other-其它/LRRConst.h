//
//  LRRConst.h
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LRRConst : NSObject

extern NSString * const LRRH5BasicURL;

extern NSString * const LRRBasicURL;

/** 测试环境环境储存后台分配的aesKey的key */
extern NSString * const LRRAesKey;
/** 保存用户的类型 */
extern NSString * const LRRUserType;
/** Itunes上的地址 */
extern NSString * const LRRAppItunesURL;
/** 融云的appkey */
extern NSString *const LRRRongCloudAppKey;
/** 显示红点的通知 */
extern NSString * const LRRShowAlertNotifacation;
/** 隐藏红点的通知 */
extern NSString * const LRRHidenAlertNotifacation;
/** 储存后台分配的deviced的key */
extern NSString * const LRRDeviceIdKey;
/** 手机号码最大长度 */
extern NSUInteger const LRRCellphoneMaxLength;
/** 验证码最大长度 */
extern NSUInteger const LRRVerificationCodeMaxLength;
/** 密码最大长度 */
extern NSUInteger const LRRPasswordMaxLength;
/** 密码最小长度 */
extern NSUInteger const LRRPasswordMinLength;
/** 昵称最大长度 */
extern NSUInteger const LRRNicknameMaxLength;
/** 用户登录的通知 */
extern NSString * const LRRUserLoginNotifacation;
/** 用户登出的通知 */
extern NSString * const LRRUserLogoutNotifacation;
/** 通用的登录流程按钮的高度 */
extern CGFloat const LRRLoginButtonHeight;
/** 设备在别处登录 */
extern NSString *const LRRConnectionStatusOffLine;

/** 身份的选择 */
extern NSString *const LRRChooseIdentityNotifacation;

/** 通用的左间距值 */
extern CGFloat const LRRLeftPadding;
/** 通用的右间距值 */
extern CGFloat const LRRRightPadding;
/** 通用的标签栏选择的高度 */
extern CGFloat const LRRDropDownHeight;

/** 通用的Item高度 */
extern CGFloat const LRRItemHeight;

@end
