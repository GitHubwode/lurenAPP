//
//  LRRReceiveOrderRequestManager.h
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHTTPSessionManager.h"

@interface LRRReceiveOrderRequestManager : LRRHTTPSessionManager

/**
 接单
 @param param 请求对象，请求参数封装为对象的属性
 @param completionHandler 请求完成的回调 responseObj 为KGGResponseObj
 @param caller 方法调用者
 */

+ (void)searchReciveOrderParam:(NSMutableDictionary *)param completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;


@end
