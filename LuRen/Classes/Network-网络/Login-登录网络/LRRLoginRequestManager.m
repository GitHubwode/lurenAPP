//
//  LRRLoginRequestManager.m
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLoginRequestManager.h"
#import "LRRRongCloudModel.h"
#import <RongIMKit/RongIMKit.h>

@implementation LRRLoginRequestManager

/**
 发送验证码
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)sendVerificationCodeToCellParam:(LRRSMSCodeParam *)param  completion:(void(^)(LRRResponseObj *responseObj))completionHandler inCaller:(id)caller
{
    //拼接URL
    NSString *url = LRRURL(@"/api/sms/applySMSCode");
    //发送请求
    [self postFormDataWithUrl:url form:[param mj_keyValues]completion:^(LRRResponseObj *responseObj) {
        if (caller && responseObj) {
            completionHandler(responseObj);
        }
    } aboveView:nil inCaller:caller];
}

/**
 登录请求
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为SNHUserObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */
+ (void)loginWithParam:(LRRLoginParam *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    //拼接url
    NSString *url = LRRURL(@"/api/login/doLogin");
    
    [self postFormDataWithUrl:url form:[param mj_keyValues] completion:^(LRRResponseObj *responseObj) {
        
        LRRLog(@"%@",responseObj);
        
        if (!responseObj) return;
        
        if (responseObj.code == LRRSuccessCode) {
            if (completionHandler) {
                LRRUserInfo *userInfo = [LRRUserInfo mj_objectWithKeyValues:responseObj.data];
                LRRLog(@"%@",userInfo);
                userInfo.userInfo.token = userInfo.token;
                [[LRRUserManager sharedUserManager]loginWithCurrentUser:userInfo.userInfo];
                [[LRRUserManager sharedUserManager] autoLogin];
                completionHandler(responseObj);
                [LRRRongCloudModel lrr_initRongCloudLogin];
            }
            
        }else if (responseObj.code != LRRSuccessCode){
            if (completionHandler) {
                completionHandler(responseObj);
            }
        }
        
    } aboveView:view inCaller:caller];
}

/**
 注册用户
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为SNHUserObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */
+ (void)registerWithParam:(LRRRegisterParam *)param completion:(void(^)(LRRUserInfo *user))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    //拼接url
    NSString *url = LRRURL(@"/api/user/register");
    
    [self postFormDataWithUrl:url form:[param mj_keyValues] completion:^(LRRResponseObj *responseObj) {
        
        LRRLog(@"%@",responseObj);
        
        if (!responseObj) return;
        
        if (LRRSuccessCode != responseObj.code) {
            [view showHint:responseObj.message];
            return;
        }
        
        if (completionHandler) {
            LRRUserInfo *userInfo = [LRRUserInfo mj_objectWithKeyValues:responseObj.data];
            LRRLog(@"%@",userInfo);
            userInfo.userInfo.token = userInfo.token;
            [[LRRUserManager sharedUserManager]loginWithCurrentUser:userInfo.userInfo];
            [[LRRUserManager sharedUserManager] autoLogin];
            completionHandler(userInfo);
        }
        
    } aboveView:view inCaller:caller];
}

/**
 退出登录
 @ param  用户登录token
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)loginOutWithcompletion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    //拼接URL
    NSString *url = LRRURL(@"/api/login/logOut");
    //发送请求
    [self requestWithURL:url httpMethod:POSTHttpMethod params:nil progress:nil completion:^(LRRResponseObj *responseObj) {
        if (!responseObj)  return ;
        if (LRRSuccessCode != responseObj.code) {
            [view showHint:responseObj.message];
        }
        if (LRRSuccessCode == responseObj.code) {
            completionHandler(responseObj);
        }
    } aboveView:view inCaller:caller];
}

/**
 获取融云链接的Token
 
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */

+ (void)setupUserRongTokencompletion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url = LRRURL(@"/api/rong/getToken");
    
    [self requestWithURL:url httpMethod:GETHttpMethod params:nil progress:nil completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
            return ;
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
            return ;
        }else{
            LRRLog(@"获取融云Token:%@",responseObj);
            if (completionHandler) {
                completionHandler(responseObj);
            }
        }
        
    } aboveView:view inCaller:caller];
}


+ (void)logout
{
    // 清除内存和本地保存的用户信息
    [[LRRUserManager sharedUserManager] logout];
    // 解除第三方的授权
    [[RCIM sharedRCIM] disconnect:NO];
    // 退出融云
    [LRRNotificationCenter postNotificationName:LRRUserLogoutNotifacation object:nil];
}
@end
