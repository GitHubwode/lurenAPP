//
//  LRRLoginRequestManager.m
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLoginRequestManager.h"

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

@end
