//
//  LRRPublishOrderParam.h
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRRPublishOrderParam : NSObject

/** 用户id */
@property (nonatomic,assign) NSUInteger  userId;
/** 订单名称 */
@property (nonatomic,copy) NSString *name;
/** 类型 */
@property (nonatomic,copy) NSString *type;
/** 用工人数 */
@property (nonatomic,assign) NSUInteger  number;
/** 用工天数 */
@property (nonatomic,assign) NSUInteger  days;
/** 用工单价 */
@property (nonatomic,assign) double  unitPrice;
/** 车费 */
@property (nonatomic,assign) double  fare;
/** 是否住工地 */
@property (nonatomic, copy) NSString *isLive;
/** 经度 */
@property (nonatomic,assign) CGFloat  longitude;
/** 维度 */
@property (nonatomic,assign) CGFloat  latitude;
/** 项目地址 */
@property (nonatomic,copy) NSString *address;
/** 项目时长 */
@property (nonatomic,copy) NSString *whenLong;
/** 联系人名称 */
@property (nonatomic,copy) NSString *contacts;
/** 联系人电话 */
@property (nonatomic,copy) NSString *contactsPhone;
/** 备注 */
@property (nonatomic,copy) NSString *remark;
/** 开始时间 */
@property (nonatomic,copy) NSString *workStartTime;
/** 支付时间 */
@property (nonatomic,copy) NSString *payTime;
/** 支付时间 */
@property (nonatomic,copy) NSString *lastPayTime;
/** 头像 */
@property (nonatomic,copy) NSString *avatarUrl;


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
                 ContactsPhone:(NSString *)contactsPhone;

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
                  ContactsPhone:(NSString *)contactsPhone;

@end
