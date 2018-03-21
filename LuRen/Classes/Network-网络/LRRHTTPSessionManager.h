//
//  LRRHTTPSessionManager.h
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#define LRRURL(string) [LRRBasicURL stringByAppendingString:string]

static NSString *LRRHttpNerworkErrorTip = @"网络不给力呀，请稍后再试~";

/**
 请求方法
 - POSTHttpMethod: POST 请求
 - GETHttpMethod: GET 请求
 */
typedef NS_ENUM(NSUInteger, HttpMethod) {
    POSTHttpMethod,
    GETHttpMethod,
};

typedef NS_ENUM(NSUInteger, LRRErrorCode) {
    LRRSuccessCode = 200,
    LRRExpiredTokenCode = 402,
    LRRFailureCode,
    LRRNoPayCode = 268, //未付款的状态
    LRRBindingWeChatSuccess = 612,//绑定微信成功
    LRRNotCancelOrder = 616, //距离开工还有5小时不能取消
    LRRCancelOrderPay = 614,//需要支付取消订单的手续费
    LRRCancelReceivedOrderPay = 615,//接单两个小时可以取消
};

@interface LRRResponseObj : NSObject
@property (nonatomic, assign) LRRErrorCode code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) id data;
@end
@interface LRRResultListObj : NSObject
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) NSUInteger pageNumber;
@property (nonatomic, assign) NSUInteger totalPage;
@property (nonatomic, strong) NSArray *dataList;
@end

/** 请求成功的回调，以下说明仅仅值调用requestWithURL:httpMethod:params:progress:completion...方法
 * 1、responseObj类型为KGGResponseObj
 * 2、responseObj = nil 表示网络错误
 * 3、responseObj != nil,responseObj.code != SNHSuccessCode 表示业务错误
 */
typedef void(^completionHandler)(id responseObj);
/** 监听进度响应的回调 */
typedef void (^progressHandler)(CGFloat progress);

@interface LRRHTTPSessionManager : NSObject

#pragma mark - 底层共用
/**
 最底层的请求方式
 
 @param url 请求地址
 @param httpMethod 请求方法 POST GET
 @param params 请求参数
 @param progressHandler 监听进度响应的回调
 @param completionHandler 请求完成的回调
 @param view HUD要添加的地方
 @param caller 方法调用者
 */
+ (void)requestWithURL:(NSString *)url httpMethod:(HttpMethod)httpMethod params:(NSMutableDictionary *)params progress:(progressHandler)progressHandler completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;
/**
 获取请求头信息
 
 @return 请求头
 */
+ (NSDictionary *)getHeaderFieldValueDictionary;

/**
 检查是网络是否打开
 
 @return YES 网络打开 NO 网络没有打开
 */
+ (BOOL)isReachable;

/**
 以POST form表单的形式提交数据
 
 @param url 请求地址
 @param form 字典数据
 @param completionHandler 请求完成的回调
 @param view HUD要添加的地方
 @param caller 方法调用者
 */

+ (void)postFormDataWithUrl:(NSString *)url form:(NSMutableDictionary *)form  completion:(void(^)(LRRResponseObj *responseObj))completionHandler aboveView:(UIView *)view inCaller:(id)caller;

@end
