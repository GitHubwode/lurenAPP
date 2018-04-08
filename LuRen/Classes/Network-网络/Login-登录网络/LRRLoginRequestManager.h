//
//  LRRLoginRequestManager.h
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHTTPSessionManager.h"
#import "LRRUserObj.h"
#import "LRRLoginParam.h"

@interface LRRLoginRequestManager : LRRHTTPSessionManager

/**
 发送验证码

 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为KGGResponseObj
 @param caller 方法调用者
 */
+ (void)sendVerificationCodeToCellParam:(LRRSMSCodeParam *)param  completion:(void(^)(LRRResponseObj *responseObj))completionHandler inCaller:(id)caller;

/**
 登录请求
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为SNHUserObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */
+ (void)loginWithParam:(LRRLoginParam *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

/**
 注册用户
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为SNHUserObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */
+ (void)registerWithParam:(LRRRegisterParam *)param completion:(void(^)(LRRUserInfo *user))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

/**
 退出登录
 @param  用户登录token
 @param completionHandler 请求完成的回调 responseObj 为KGGResponseObj
 @param caller 方法调用者
 */
+ (void)loginOutWithcompletion:(void(^)(LRRResponseObj *responseObj))completionHandler inCaller:(id)caller;
/**
 获取融云链接的Token
 
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */

+ (void)setupUserRongTokencompletion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

+ (void)logout;


@end
