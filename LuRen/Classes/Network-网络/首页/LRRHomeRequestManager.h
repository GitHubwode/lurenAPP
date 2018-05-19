//
//  LRRHomeRequestManager.h
//  LuRen
//
//  Created by Ding on 2018/5/1.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHTTPSessionManager.h"

@interface LRRHomeRequestManager : LRRHTTPSessionManager

/**
 获取首页的信息
 @param page 页数  rows 行数
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 
 */
+ (void)homeMessagePage:(NSUInteger )page Rows:(NSUInteger )rows completion:(void(^)(LRRResponseObj*response))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

/**
 轮播图
 @param completionHandler 请求完成的回调 responseObj 为LRRResponseObj
 @param caller 方法调用者
 */
+ (void)homeTopScrollViewCompletion:(void(^)(LRRResponseObj*response))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

@end
