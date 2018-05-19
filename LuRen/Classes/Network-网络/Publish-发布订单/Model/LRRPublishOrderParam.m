//
//  LRRPublishOrderParam.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishOrderParam.h"

@implementation LRRPublishOrderParam

- (instancetype)initWithUserId:(NSUInteger )userid
                          Name:(NSString *)name
                          Type:(NSString *)type
                      WorkType:(NSString *)workType
                        Number:(NSUInteger )number
                          Days:(NSUInteger )days
                     UnitPrice:(double )unitPrice
                          Fare:(double )fare
                      IsSiting:(NSUInteger)isSiting
                   ProjectDesc:(NSString *)projectDesc
                   WorkEndTime:(NSString *)workEndTime
                WorkDevingTime:(NSString *)workDevingTime
                    WorkAmount:(NSUInteger )workAmount
                        Remark:(NSString *)remark
                 WorkStartTime:(NSString *)workStartTime
                   LastPayTime:(NSString *)lastPayTime
                     Longitude:(CGFloat )longitude
                      Latitude:(CGFloat )latitude
                       Address:(NSString *)address
                     AvatarUrl:(NSString *)avatarUrl
                      WhenLong:(NSString *)whenLong
                      Contacts:(NSString *)contacts
                 ContactsPhone:(NSString *)contactsPhone
{
    self = [super init];
    if (self) {
        self.userId = userid;
        self.name = name;
        self.type = type;
        self.workType = workType;
        self.number = number;
        self.days = days;
        self.unitPrice = unitPrice;
        self.fare = fare;
        self.isSiting = isSiting;
        self.projectDesc = projectDesc;
        self.workEndTime = workEndTime;
        self.workDevingTime = workDevingTime;
        self.workAmount = workAmount;
        self.remark = remark;
        self.workStartTime = workStartTime;
        self.lastPayTime = lastPayTime;
        self.longitude = longitude;
        self.latitude = latitude;
        self.address = address;
        self.avatarUrl = avatarUrl;
        self.whenLong = whenLong;
        self.contacts = contacts;
        self.contactsPhone = contactsPhone;
    }
    return self;
}

+ (instancetype)paramWithUserId:(NSUInteger )userid
                           Name:(NSString *)name
                           Type:(NSString *)type
                       WorkType:(NSString *)workType
                         Number:(NSUInteger )number
                           Days:(NSUInteger )days
                      UnitPrice:(double )unitPrice
                           Fare:(double )fare
                       IsSiting:(NSUInteger)isSiting
                    ProjectDesc:(NSString *)projectDesc
                    WorkEndTime:(NSString *)workEndTime
                 WorkDevingTime:(NSString *)workDevingTime
                     WorkAmount:(NSUInteger )workAmount
                         Remark:(NSString *)remark
                  WorkStartTime:(NSString *)workStartTime
                    LastPayTime:(NSString *)lastPayTime
                      Longitude:(CGFloat )longitude
                       Latitude:(CGFloat )latitude
                        Address:(NSString *)address
                      AvatarUrl:(NSString *)avatarUrl
                       WhenLong:(NSString *)whenLong
                       Contacts:(NSString *)contacts
                  ContactsPhone:(NSString *)contactsPhone
{
    return [[self alloc]initWithUserId:userid Name:name
                                  Type:type
                              WorkType:workType
                                Number:number
                                  Days:days
                             UnitPrice:unitPrice
                                  Fare:fare
                              IsSiting:isSiting
                           ProjectDesc:projectDesc
                           WorkEndTime:workEndTime
                        WorkDevingTime:workDevingTime
                            WorkAmount:workAmount
                                Remark:remark
                         WorkStartTime:workStartTime
                           LastPayTime:lastPayTime
                             Longitude:longitude
                              Latitude:latitude
                               Address:address
                             AvatarUrl:avatarUrl
                              WhenLong:whenLong
                              Contacts:contacts
                         ContactsPhone:contactsPhone];
}


@end
