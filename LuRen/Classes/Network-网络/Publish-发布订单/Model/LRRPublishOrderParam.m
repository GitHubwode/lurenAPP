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
                        Number:(NSUInteger )number
                          Days:(NSUInteger )days
                     UnitPrice:(double )unitPrice
                          Fare:(double )fare
                        Remark:(NSString *)remark
                      OrderUrl:(NSString *)orderUrl
                 WorkStartTime:(NSString *)workStartTime
                       PayTime:(NSString *)payTime
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
        self.number = number;
        self.days = days;
        self.unitPrice = unitPrice;
        self.fare = fare;
        self.remark = remark;
        self.workStartTime = workStartTime;
        self.payTime = payTime;
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
                         Number:(NSUInteger )number
                           Days:(NSUInteger )days
                      UnitPrice:(double )unitPrice
                           Fare:(double )fare
                         Remark:(NSString *)remark
                       OrderUrl:(NSString *)orderUrl
                  WorkStartTime:(NSString *)workStartTime
                        PayTime:(NSString *)payTime
                    LastPayTime:(NSString *)lastPayTime
                      Longitude:(CGFloat )longitude
                       Latitude:(CGFloat )latitude
                        Address:(NSString *)address
                      AvatarUrl:(NSString *)avatarUrl
                       WhenLong:(NSString *)whenLong
                       Contacts:(NSString *)contacts
                  ContactsPhone:(NSString *)contactsPhone
{
    return [[self alloc]initWithUserId:userid Name:name Type:type Number:number Days:days UnitPrice:unitPrice Fare:fare Remark:remark OrderUrl:orderUrl WorkStartTime:workStartTime PayTime:payTime LastPayTime:lastPayTime Longitude:longitude Latitude:latitude Address:address AvatarUrl:avatarUrl WhenLong:whenLong Contacts:contacts ContactsPhone:contactsPhone];
}


@end
