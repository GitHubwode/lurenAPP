//
//  LRRConst.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRConst.h"

@implementation LRRConst

#ifdef DEBUG
NSString * const LRRBasicURL = @"https://service.sunvhui.net";

NSString * const LRRH5BasicURL = @"https://h5test.sunvhui.net/h5";

#else
NSString * const LRRBasicURL = @"https://service.sunvhui.net";

NSString * const LRRH5BasicURL = @"https://h5.sunvhui.net/h5";
#endif
//
/** Itunes上的地址 */
NSString * const LRRAppItunesURL = @"https://itunes.apple.com/app/id1176374492";
/** 储存后台分配的deviced的key */
NSString * const LRRDeviceIdKey = @"LRRDeviceIdKey";;
/** 手机号码最大长度 */
NSUInteger const LRRCellphoneMaxLength = 11;
/** 验证码最大长度 */
NSUInteger const LRRVerificationCodeMaxLengt = 4;
/** 密码最大长度 */
NSUInteger const LRRPasswordMaxLength = 16;
/** 密码最小长度 */
NSUInteger const LRRPasswordMinLength = 6;
/** 昵称最大长度 */
NSUInteger const LRRNicknameMaxLength = 8;
/** 用户登录的通知 */
NSString * const LRRUserLoginNotifacation = @"LRRUserLoginNotifacation";
/** 用户登出的通知 */
NSString * const LRRUserLogoutNotifacation = @"LRRUserLogoutNotifacation";
/** 通用的登录流程按钮的高度 */
CGFloat const LRRLoginButtonHeight = 49;
/** 设备在别处登录 */
NSString *const LRRConnectionStatusOffLine = @"LRR_KICKED_OFFLINE_BY_OTHER_CLIENT";

/** 通用的左间距值 */
CGFloat const LRRLeftPadding = 15.f;
/** 通用的右间距值 */
CGFloat const LRRRightPadding = 15.f;

@end
