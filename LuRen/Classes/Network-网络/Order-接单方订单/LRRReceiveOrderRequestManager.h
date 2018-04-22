//
//  LRRReceiveOrderRequestManager.h
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHTTPSessionManager.h"
#import "LRROrderDetailsModel.h"

typedef NS_ENUM(NSUInteger, LRRReceiveOrderRequestType) {
    LRRReceiveALLOrderRequestType,//接单方显示所有未接订单
    LRRReceiveCompleteOrderRequestType, // 我已完成的订单
    LRRReceiveRecivedOrderRequestType,//获取我的已接订单
};

@interface LRRReceiveOrderRequestManager : LRRHTTPSessionManager

/**
 接单
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */

+ (void)searchReciveOrderParam:(NSMutableDictionary *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;
/**
 获取订单信息列表或者完成 进行中
 @param type 接口类型
 @param page 页数  userId 用户id
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 
 */
+ (void)searchOrderListType:(LRRReceiveOrderRequestType)type Page:(NSUInteger )page Longitude:(CGFloat )longitude Latitude:(CGFloat )latitude completion:(void(^)(NSArray<LRROrderDetailsModel *>*response))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

@end
