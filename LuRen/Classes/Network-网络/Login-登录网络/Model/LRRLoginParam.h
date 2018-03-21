//
//  LRRLoginParam.h
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

/******************** 验证码 **********************/

/**
 验证码类型
 - LOGIN
 -
 */
typedef NS_ENUM(NSUInteger, CodeType) {
    CodeTypeLogin,
    CodeTypeForget,
};

@interface LRRSMSCodeParam : NSObject

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *type;
//@property (nonatomic, assign) CodeType type;
@property (nonatomic, assign) long timestamp;
@property (nonatomic, copy) NSString *signature;//MD5签名 签名算法构成：MD5(phone + type + timestamp + secretKey)

- (instancetype)initWithPhone:(NSString *)phone
                         Type:(NSString *)type
                    Timestamp:(long )timestamp
                    Signature:(NSString *)signature;

+ (instancetype)paramWithPhone:(NSString *)phone
                          Type:(NSString *)type
                     Timestamp:(long )timestamp
                     Signature:(NSString *)signature;

@end


@interface LRRLoginParam : NSObject

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *smsCode;
@property (nonatomic, copy) NSString *mode; //登录方式

- (instancetype)initWithPhone:(NSString *)phone
                     password:(NSString *)password
                      SmsCode:(NSString *)smsCode
                         Mode:(NSString *)model;

+ (instancetype)paramWithPhone:(NSString *)phone
                      password:(NSString *)password
                       SmsCode:(NSString *)smsCode
                          Mode:(NSString *)model;

@end
