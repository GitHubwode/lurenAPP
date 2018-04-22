//
//  LRREditUserRequestManager.m
//  LuRen
//
//  Created by Ding on 2018/4/22.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRREditUserRequestManager.h"

@implementation LRREditUserRequestManager

/**
 编辑用户的信息保存
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)editUserMessageParam:(LRREditMesssParam *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url = LRRURL(@"/api/user/updateUser");
    //发送请求
    [self postFormDataWithUrl:url form:[param mj_keyValues] completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
            
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
        }
        if (completionHandler) {
            completionHandler(responseObj);
        }
        
    } aboveView:view inCaller:caller];
}

/**
 更改用户头像
 
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */

+ (void)updataUserAvatarString:(NSString *)avatarString completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url = LRRURL(@"/api/user/updateAvatar");
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"base64"] = avatarString;
    
    [self postFormDataWithUrl:url form:dic completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
            [view showHint:LRRHttpNerworkErrorTip];
            
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
        }
        if (completionHandler) {
            
            LRRUserObj *userObj = [LRRUserObj mj_objectWithKeyValues:responseObj.data];
            [[LRRUserManager sharedUserManager] updateCurrentUserAvatar:userObj.avatarUrl];
            [[LRRUserManager sharedUserManager] synchronize];
            completionHandler(responseObj);
        }
    } aboveView:view inCaller:caller];
}
@end
