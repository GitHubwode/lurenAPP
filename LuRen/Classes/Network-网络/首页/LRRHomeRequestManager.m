//
//  LRRHomeRequestManager.m
//  LuRen
//
//  Created by Ding on 2018/5/1.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeRequestManager.h"

@implementation LRRHomeRequestManager

/**
 获取首页的信息
 @param page 页数  rows 行数
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 
 */
+ (void)homeMessagePage:(NSUInteger )page Rows:(NSUInteger )rows completion:(void(^)(LRRResponseObj*response))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"page"] = @(page);
    param[@"rows"] = @(rows);
    NSString *url = LRRURL(@"/api/user/findUserList");
    [self postFormDataWithUrl:url form:param completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
            [view showHint:LRRHttpNerworkErrorTip];
            return ;
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
        }
        
        LRRLog(@"responseObj %@",responseObj);
        
        if (completionHandler) {
            completionHandler(responseObj);
        }
        
        
    } aboveView:view inCaller:caller];
}

/**
 轮播图
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)homeTopScrollViewCompletion:(void(^)(LRRResponseObj*response))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url = LRRURL(@"/api/version/getBannerUrl");
    [self requestWithURL:url httpMethod:GETHttpMethod params:nil progress:nil completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
            [view showHint:LRRHttpNerworkErrorTip];
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
        }
        if (completionHandler) {
            completionHandler(responseObj);
        }
    } aboveView:view inCaller:caller];
}

@end
