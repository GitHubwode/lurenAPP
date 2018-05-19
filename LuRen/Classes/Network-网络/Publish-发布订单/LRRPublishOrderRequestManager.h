//
//  LRRPublishOrderRequestManager.h
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHTTPSessionManager.h"
#import "LRRPublishOrderParam.h"
#import "LRRUserMessageModel.h"

@interface LRRPublishOrderRequestManager : LRRHTTPSessionManager

/**
 创建订单
 
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)publishCreatOrderParam:(LRRPublishOrderParam *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

/**
 取消订单
 
 @param orderId 请求对象为订单的id
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */

+ (void)publishCancelOrderId:(NSUInteger )orderId completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;
/**
 发布发现工人
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)publishLookWorkerPageNum:(NSUInteger )pageNum Rows:(NSUInteger )rows Type:(NSString *)type completion:(void(^)(NSArray<LRRUserMessageModel *>*responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;
@end
