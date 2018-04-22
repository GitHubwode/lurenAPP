//
//  LRREditUserRequestManager.h
//  LuRen
//
//  Created by Ding on 2018/4/22.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHTTPSessionManager.h"
#import "LRREditMesssParam.h"

@interface LRREditUserRequestManager : LRRHTTPSessionManager

/**
编辑用户的信息保存

@param param 请求对象，请求参数封装为对象的属性
@param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
@param caller 方法调用者
*/
+ (void)editUserMessageParam:(LRREditMesssParam *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

/**
 更改用户头像
 
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param view HUD要添加的地方
 @param caller 方法调用者
 */

+ (void)updataUserAvatarString:(NSString *)avatarString completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;
@end
