//
//  LRRUserObj.h
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 性别 */
typedef NS_ENUM(NSUInteger, UserGender) {
    UserGenderUnknown = 0,  /** 未知 */
    UserGenderMan,          /** 男 */
    UserGenderWoman         /** 女 */
};

@interface LRRUserObj : NSObject<NSCoding>

/** 用户id */
@property (nonatomic,copy) NSString *userId;
/** 头像 */
@property (nonatomic,copy) NSString *avatarUrl;
/** 电话 */
@property (nonatomic,copy) NSString *phone;
/** 是否删除 */
@property (nonatomic,copy) NSString *isDelete;
/** 是否锁定 */
@property (nonatomic,copy) NSString *isLock;
/** 是否实名认证 */
@property (nonatomic, copy) NSString *isRealname;
/** 真是姓名 */
@property (nonatomic, copy) NSString *relayName;
/** 团队人数 */
@property (nonatomic, copy) NSString *teamGroup;
/** 民族 */
@property (nonatomic, copy) NSString *nation;
/** 工龄 */
@property (nonatomic, copy) NSString *workAge;
/** 工中 */
@property (nonatomic, copy) NSString *workType;
/** 籍贯 */
@property (nonatomic, copy) NSString *hometown;
/** 昵称 */
@property (nonatomic,copy) NSString *nickname;
/** 生日 */
@property (nonatomic,copy) NSString *birthday;
/** 性别 */
@property (nonatomic,copy) NSString *sex;
/** 角色 */
@property (nonatomic,copy) NSString *type;
/** 创建时间 */
@property (nonatomic,copy) NSString *createDate;
/** 更新时间 */
@property (nonatomic,copy) NSString *updateDate;
///** 是否为会员 */
//@property (nonatomic,assign) BOOL  hasVIP;
/** 会员结束时间 */
//@property (nonatomic,copy) NSString *vipEndTime;
/** 增加的属性 */
@property (nonatomic,copy) NSString *token;
@property (nonatomic, copy) NSString *sexName;
@property (nonatomic, assign) BOOL isLocked;
@property (nonatomic, assign) BOOL isDeleted;
@property (nonatomic, assign) BOOL isRealnameed;
@property (nonatomic, copy) NSString *hidePhone;
/** 是否注册用户 */
@property (nonatomic,assign) BOOL  isRegister;
/** 邀请人的手机号 */
//@property (nonatomic, copy) NSString *personCode;
@end

@interface LRRUserInfo : NSObject <NSCoding>

/** token */
@property (nonatomic,copy) NSString *token;
//@property (nonatomic, copy) NSString *nowPlaceRegisterVip;

@property (nonatomic, strong) LRRUserObj *userInfo;

@end

