//
//  LRRReportParam.h
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRRReportParam : NSObject
/** 举报人id */
@property (nonatomic,assign) NSUInteger  reportId;
/** 举报订单号 */
@property (nonatomic, copy) NSString *orderNo;
/** 举报内容 */
@property (nonatomic, copy) NSString *reportContent;
/** 被举报人手机号码 */
@property (nonatomic, copy) NSString *reportedPhone;
/** 举报人手机号码 */
@property (nonatomic, copy) NSString *reportPhone;

- (instancetype)initWithReportId:(NSUInteger )reportId
                          OrderNo:(NSString *)orderNo
                          ReportContent:(NSString *)reportContent
                        ReportedPhone:(NSString *)reportedPhone
                          ReportPhone:(NSString *)reportPhone;

+ (instancetype)paramWithReportId:(NSUInteger )reportId
                          OrderNo:(NSString *)orderNo
                    ReportContent:(NSString *)reportContent
                    ReportedPhone:(NSString *)reportedPhone
                      ReportPhone:(NSString *)reportPhone;


@end
