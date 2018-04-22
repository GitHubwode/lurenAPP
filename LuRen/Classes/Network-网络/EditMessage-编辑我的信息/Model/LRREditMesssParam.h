//
//  LRREditMesssParam.h
//  LuRen
//
//  Created by Ding on 2018/4/22.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRREditMesssParam : NSObject
/**  */
@property (nonatomic, copy) NSString *type;
/** 昵称 */
@property (nonatomic, copy) NSString *nickname;
/** 头像地址 */
@property (nonatomic, copy) NSString *avatarUrl;
/** 电话号码 */
@property (nonatomic, copy) NSString *phone;
/**邀请码*/
//@property (nonatomic, copy) NSString *invitationCode;
/** 性别 */
@property (nonatomic, copy) NSString *sex;
/** 密码 */
//@property (nonatomic, copy) NSString *password;
/** 真实姓名 */
@property (nonatomic, copy) NSString *name;
/** 民族 */
@property (nonatomic, copy) NSString *nation;
/** 身日 */
@property (nonatomic, copy) NSString *birthday;
/** 籍贯 */
@property (nonatomic, copy) NSString *hometown;
/** 团队人数 */
@property (nonatomic, copy) NSString *teamGroup;
/** 工种 */
@property (nonatomic, copy) NSString *workType;
/**工龄 */
@property (nonatomic, copy) NSString *workAge;
/** 是否真的姓名 */
//@property (nonatomic, copy) NSString *isRealname;
/** 穿件地址 */
@property (nonatomic, copy) NSString *currentAddress;

- (instancetype)initWithType:(NSString *)type
                    Nickname:(NSString *)nickname
                   AvatarUrl:(NSString *)avatarUrl
                       Phone:(NSString *)phone
                         Sex:(NSString *)sex
                        Name:(NSString *)name
                      Nation:(NSString *)nation
                    Birthday:(NSString *)birthday
                    Hometown:(NSString *)hometown
                   TeamGroup:(NSString *)teamGroup
                    WorkType:(NSString *)workType
                     WorkAge:(NSString *)workAge;

+ (instancetype)paramWithType:(NSString *)type
                     Nickname:(NSString *)nickname
                    AvatarUrl:(NSString *)avatarUrl
                        Phone:(NSString *)phone
                          Sex:(NSString *)sex
                         Name:(NSString *)name
                       Nation:(NSString *)nation
                     Birthday:(NSString *)birthday
                     Hometown:(NSString *)hometown
                    TeamGroup:(NSString *)teamGroup
                     WorkType:(NSString *)workType
                      WorkAge:(NSString *)workAge;

@end
