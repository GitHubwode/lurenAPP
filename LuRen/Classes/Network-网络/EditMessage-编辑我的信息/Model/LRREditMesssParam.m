//
//  LRREditMesssParam.m
//  LuRen
//
//  Created by Ding on 2018/4/22.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRREditMesssParam.h"

@implementation LRREditMesssParam

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
                     WorkAge:(NSString *)workAge
{
    self = [super init];
    if (self) {
        self.type = type;
        self.nickname = nickname;
        self.avatarUrl = avatarUrl;
        self.phone = phone;
        self.sex = sex;
        self.name = name;
        self.nation = nation;
        self.birthday = birthday;
        self.hometown = hometown;
        self.teamGroup = teamGroup;
        self.workType = workType;
        self.workAge = workAge;
    }
    return self;
}

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
                      WorkAge:(NSString *)workAge
{
    return [[self alloc]initWithType:type Nickname:nickname AvatarUrl:avatarUrl Phone:phone Sex:sex Name:name Nation:nation Birthday:birthday Hometown:hometown TeamGroup:teamGroup WorkType:workType WorkAge:workAge];
}

@end
