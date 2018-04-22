//
//  LRRPublishOrderRequestManager.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishOrderRequestManager.h"

@implementation LRRPublishOrderRequestManager

/**
 创建订单
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)publishCreatOrderParam:(LRRPublishOrderParam *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url = LRRURL(@"/api/order/create");
    //发送请求
    [self postFormDataWithUrl:url form:[param mj_keyValues] completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
        }
        if (completionHandler) {
            completionHandler(responseObj);
        }
    } aboveView:view inCaller:caller];
    
    [self requestWithURL:url httpMethod:POSTHttpMethod params:[param mj_keyValues] progress:nil completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
        }
        if (completionHandler) {
            completionHandler(responseObj);
        }
    } aboveView:view inCaller:caller];
    
}

/**
 取消订单
 
 @param orderId 请求对象为订单的id
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */

+ (void)publishCancelOrderId:(NSUInteger )orderId completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url = LRRURL(@"/api/order/cancel");
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"id"] = @(orderId);
    
    //发送请求
    [self postFormDataWithUrl:url form:dic completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) {
            
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
        }
        if (completionHandler) {
            completionHandler(responseObj);
        }
        
    } aboveView:view inCaller:caller];
}

@end
