//
//  LRRLoginParam.m
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLoginParam.h"

/******************** 验证码 **********************/

@implementation LRRSMSCodeParam

- (instancetype)initWithPhone:(NSString *)phone Type:(NSString *)type Timestamp:(long)timestamp Signature:(NSString *)signature
{
    self = [super init];
    if (self) {
        self.phone = phone;
        self.type = type;
        self.timestamp = timestamp;
        self.signature = signature;
    }
    return self;
}

+ (instancetype)paramWithPhone:(NSString *)phone Type:(NSString *)type Timestamp:(long)timestamp Signature:(NSString *)signature
{
    return [[self alloc]initWithPhone:phone Type:type Timestamp:timestamp Signature:signature];
}

@end

/**************************** 登录 ******************************/

@implementation LRRLoginParam

- (instancetype)initWithPhone:(NSString *)phone password:(NSString *)password SmsCode:(NSString *)smsCode Mode:(NSString *)model
{
    self = [super init];
    if (self) {
        self.phone = phone;
        self.password = password;
        self.smsCode = smsCode;
        self.mode = model;
    }
    return self;
}

+ (instancetype)paramWithPhone:(NSString *)phone password:(NSString *)password SmsCode:(NSString *)smsCode Mode:(NSString *)model
{
    return [[self alloc]initWithPhone:phone password:password SmsCode:smsCode Mode:model];
}

@end

/**************************** 注册 ******************************/
@implementation  LRRRegisterParam

- (instancetype)initWithPhone:(NSString *)phone
                         Type:(NSString *)type
{
    self = [super init];
    if (self) {
        self.phone = phone;
        self.type = type;
    }
    return self;
}

+ (instancetype)paramWithPhone:(NSString *)phone
                          Type:(NSString *)type
{
    return [[self alloc]initWithPhone:phone Type:type];
}


@end
