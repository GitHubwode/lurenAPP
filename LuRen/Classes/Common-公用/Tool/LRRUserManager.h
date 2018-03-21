//
//  LRRUserManager.h
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRRUserObj.h"

@interface LRRUserManager : NSObject

@property (nonatomic, assign, readonly) BOOL logined;

@property (nonatomic, strong, readonly) LRRUserObj *currentUser;

@property (nonatomic, assign) BOOL canPay;

+ (instancetype)shareUserManager;

/**
 登录，让登录操作和user产生依赖关系，持久化用户对象
 
 @param user 当前登录的用户
 */
- (void)loginWithCurrentUser:(LRRUserObj *)user;

/**
 * 自动登录,每次打开APP的时候调用一次即可
 * 主动登录，需要设置单例的currentUser和token两个地方
 * 1.加载本地用户对象到单例中，用户没有登录时为nil
 * 2.加载本地Token到单例中,用户没有登录时为""
 */
- (void)autoLogin;

/**
 退出登录
 1.删除本地存储的用户
 2.删除本地存储的token
 */
- (void)logout;

/**
 同步用户信息到本地
 */
- (void)synchronize;

- (void)updateCurrentUserAvatar:(NSString *)avatar;
- (void)updateCurrentUserName:(NSString *)name;
- (void)updateCurrentUserMobile:(NSString *)mobile;
- (void)updateCurrentUserNewToken:(NSString *)token;
- (void)updateCurrentUserNewType:(NSString *)userType;
- (void)updateCurrentUserBossVIP:(BOOL)isVIP;
- (void)updateCurrentUserSex:(NSString *)sex;


@end
