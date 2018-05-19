//
//  LRRReceiveOrderRequestManager.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRReceiveOrderRequestManager.h"

@implementation LRRReceiveOrderRequestManager

/**
 接单
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */

+ (void)searchReciveOrderParam:(NSMutableDictionary *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller{
    NSString *url = LRRURL(@"/api/order/accept");
    [self postFormDataWithUrl:url form:param completion:^(LRRResponseObj *responseObj) {
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
 获取订单信息列表或者完成 进行中
 @param type 接口类型
 @param page 页数  userId 用户id
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 
 */
+ (void)searchOrderListType:(LRRReceiveOrderRequestType)type Page:(NSUInteger )page Longitude:(CGFloat )longitude Latitude:(CGFloat )latitude completion:(void(^)(NSArray<LRROrderDetailsModel *>*response))completionHandler aboveView:(UIView *)view inCaller:(id)caller
{
    NSString *url;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    NSString * userId = [LRRUserManager sharedUserManager].currentUser.userId;
    
    NSString *IdString = [NSUserDefaults objectForKey:LRRUserType];
    if ([IdString isEqualToString:@"WORKER"]) {
        switch (type) {
            case LRRReceiveALLOrderRequestType: // 所有未完成订单
                url = LRRURL(@"/api/order/getAllOrder");
                dic[@"page"] = @(page);
                break;
            case LRRReceiveCompleteOrderRequestType: // 我已完成的订单 getMyAcceptComplete  获取我的已完成订单  已接单就算完成
                url = LRRURL(@"/api/order/getUnCompleteNoPay");
                dic[@"page"] = @(page);
                dic[@"acceptUser"] = userId;
                break;
            case LRRReceiveNotAcceptOrderRequestType://获取我的未接单订单
                url = LRRURL(@"/api/order/getUnComplete");
                dic[@"page"] = @(page);
                dic[@"userId"] = userId;
            default:
                break;
        }
    }else{
        switch (type) {
            case LRRReceiveALLOrderRequestType: // 所有未完成订单
                url = LRRURL(@"/api/order/getAllOrder");
                dic[@"page"] = @(page);
                break;
            case LRRReceiveCompleteOrderRequestType: // 我已完成的订单 getMyAcceptComplete  获取我的已完成订单  已接单就算完成
                url = LRRURL(@"/api/order/getUnCompleteNoPay");
                dic[@"page"] = @(page);
                dic[@"userId"] = userId;
                break;
            case LRRReceiveNotAcceptOrderRequestType://获取我的未接单订单
                url = LRRURL(@"/api/order/getUnComplete");
                dic[@"page"] = @(page);
                dic[@"userId"] = userId;
            default:
                break;
        }
    }
    
    [self requestWithURL:url httpMethod:GETHttpMethod params:dic progress:nil completion:^(LRRResponseObj *responseObj) {
        
        NSArray *responseDatasource;
        if (!responseObj) {
            
        }else if (responseObj.code != LRRSuccessCode){
            [view showHint:responseObj.message];
        }else{
            NSArray *recordList = [responseObj.data objectForKey:@"recordList"];
            responseDatasource = [LRROrderDetailsModel mj_objectArrayWithKeyValuesArray:recordList];
            if (completionHandler) {
                completionHandler(responseDatasource);
            }
        }
        
    } aboveView:nil inCaller:caller];
    
}

@end
