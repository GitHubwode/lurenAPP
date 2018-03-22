//
//  LRRUserManager.m
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRUserManager.h"

/** 账号的存储路径 */
#define LRRAccountSavePath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@interface LRRUserManager ()
@property (nonatomic, strong) NSString *deviceId;

@end

@implementation LRRUserManager

+ (instancetype)sharedUserManager{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
#pragma mark - 登录,登出相关
/**
 登录，让登录操作和user产生依赖关系，持久化用户对象
 
 @param user 当前登录的用户
 */
- (void)loginWithCurrentUser:(LRRUserObj *)user
{
    if (!user)  return;
    [self saveAccount:user];
    _currentUser = user;
    _logined = user.token.length;
}

/**
 * 自动登录
 * 主动登录，需要设置单例的currentUser和token两个地方
 * 1.加载本地用户对象到单例中，用户没有登录时为nil
 * 2.加载本地Token到单例中,用户没有登录时为""
 */
- (void)autoLogin
{
    _currentUser = [self user];
    
    _logined = _currentUser ? _currentUser.token.length : NO;
}

/**
 退出登录
 1.删除本地存储的用户
 2.删除本地存储的token
 */
- (void)logout
{
    [self removeAccount];
    _currentUser = nil;
    _logined = NO;
    
}

/**
 提供一个专门获取token的方法, 防止currentUser为空时崩溃
 
 @return 当前用户的token
 */
- (NSString *)token
{
    LRRUserObj *user = _currentUser;
    return user ? user.token : nil;
}

- (void)updateCurrentUserName:(NSString *)name
{
    if (!_currentUser) return;
    _currentUser.nickname = name;
    [self saveAccount:_currentUser];
}

- (void)updateCurrentUserAvatar:(NSString *)avatar
{
    if (!_currentUser) return;
    _currentUser.avatarUrl = avatar;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserSex:(NSString *)sex
{
    if (!_currentUser) return;
    _currentUser.sex = sex;
    _currentUser.sexName = [sex isEqualToString:@"MAN"] ? @"男" :@"女";
    [self saveAccount:_currentUser];
}

- (void)updateCurrentUserMobile:(NSString *)mobile
{
    if (!_currentUser) return;
    _currentUser.phone = mobile;
    _currentUser.hidePhone = [NSString numberSuitScanf:mobile];
    [self saveAccount:_currentUser];
}

- (void)updateCurrentUserNewToken:(NSString *)token
{
    if (!_currentUser) return;
    _currentUser.token = token;
    [self saveAccount:_currentUser];
}

- (void)updateCurrentUserNewType:(NSString *)userType
{
    if (!_currentUser) return;
    _currentUser.type = userType;
    [self saveAccount:_currentUser];
}

- (void)updateCurrentUserNation:(NSString *)nation
{
    if (!_currentUser) return;
    _currentUser.nation = nation;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserRelayName:(NSString *)relayName
{
    if (!_currentUser) return;
    _currentUser.relayName = relayName;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserBirthday:(NSString *)birthday
{
    if (!_currentUser) return;
    _currentUser.birthday = birthday;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserHometown:(NSString *)hometown
{
    if (!_currentUser) return;
    _currentUser.hometown = hometown;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserTeamGroup:(NSString *)teamGroup
{
    if (!_currentUser) return;
    _currentUser.teamGroup = teamGroup;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserWorkAge:(NSString *)workAge
{
    if (!_currentUser) return;
    _currentUser.workAge = workAge;
    [self saveAccount:_currentUser];
}
- (void)updateCurrentUserWorkType:(NSString *)workType
{
    if (!_currentUser) return;
    _currentUser.workType = workType;
    [self saveAccount:_currentUser];
}

//- (void)updateCurrentUserBossVIP:(BOOL)isVIP
//{
//    if (!_currentUser) return;
////    _currentUser.hasVIP = isVIP;
//    [self saveAccount:_currentUser];
//}

/**
 同步用户信息到本地
 */
- (void)synchronize
{
    if (!_currentUser)  return;
    [self saveAccount:_currentUser];
}

#pragma mark -存储,删除 取出用户
- (void)saveAccount:(LRRUserObj *)user
{
    BOOL flag = [NSKeyedArchiver archiveRootObject:user toFile:LRRAccountSavePath];
    LRRLog(@"%@",LRRAccountSavePath);
    LRRLog(@"flag = %zd",flag);
    if (flag) {
        LRRLog(@"成功");
    }else{
        LRRLog(@"失败");
    }
}

- (BOOL)removeAccount{
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager removeItemAtPath:LRRAccountSavePath error:nil];
}

- (LRRUserObj *)user
{
    LRRUserObj *user =[NSKeyedUnarchiver unarchiveObjectWithFile:LRRAccountSavePath];
    LRRLog(@"=========%@",user.token);
    LRRLog(@"!!!!!!!!!!%@",user.nickname);
    return [NSKeyedUnarchiver unarchiveObjectWithFile:LRRAccountSavePath];
}


@end
