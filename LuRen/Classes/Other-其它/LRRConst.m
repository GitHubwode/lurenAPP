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
//NSString * const LRRBasicURL = @"http://10.205.96.11:8080";
NSString * const LRRBasicURL = @"http://kfjugong.com";


NSString * const LRRH5BasicURL = @"https://h5test.sunvhui.net/h5";

#else
NSString * const LRRBasicURL = @"https://service.sunvhui.net";

NSString * const LRRH5BasicURL = @"https://h5.sunvhui.net/h5";
#endif


/** 正式环境储存后台分配的aesKey的key */
//NSString * const LRRAesKey = @"USGzksAv^4yjMOsiiH#hN^KTS@ir%cg7MpOrA#xBAhHzSKUQXdtF^vRx&AkdRIdj";

/** 测试环境环境储存后台分配的aesKey的key */
NSString * const LRRAesKey = @"USGzksAv^4yjMOsiiH#hN^KTS@ir%cg7MpOrA#xBAhHzSKUQXdtF^vRx&AkdRIdj";

/** Itunes上的地址 */
NSString * const LRRAppItunesURL = @"https://itunes.apple.com/app/id1387118823";
/** 储存后台分配的deviced的key */
NSString * const LRRDeviceIdKey = @"LRRDeviceIdKey";
/** 保存用户的类型 */
NSString * const LRRUserType = @"LRRUserType";

/** 测试 融云的appkey */
NSString *const LRRRongCloudAppKey = @"bmdehs6pbrrbs";
/** 正式 融云的appkey */
//NSString *const LRRRongCloudAppKey = @"uwd1c0sxuvrc1";

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
/** 显示红点的通知 */
NSString * const LRRShowAlertNotifacation = @"LRRShowAlertNotifacation";
/** 隐藏红点的通知 */
NSString * const LRRHidenAlertNotifacation = @"LRRHidenAlertNotifacation";
/** 通用的登录流程按钮的高度 */
CGFloat const LRRLoginButtonHeight = 49;
/** 设备在别处登录 */
NSString *const LRRConnectionStatusOffLine = @"LRR_KICKED_OFFLINE_BY_OTHER_CLIENT";
/** 身份的选择 */
NSString *const LRRChooseIdentityNotifacation = @"LRRChooseIdentityNotifacation";
/** 通用的左间距值 */
CGFloat const LRRLeftPadding = 15.f;
/** 通用的右间距值 */
CGFloat const LRRRightPadding = 15.f;
/** 通用的标签栏选择的高度 前期不要选择地点与工种 后期需要再加高度45 */
CGFloat const LRRDropDownHeight = 0.f;
/** 通用的item高度 */
CGFloat const LRRItemHeight = 44.f;

@end
