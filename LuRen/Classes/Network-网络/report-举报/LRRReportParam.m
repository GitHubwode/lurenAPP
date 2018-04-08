//
//  LRRReportParam.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRReportParam.h"

@implementation LRRReportParam

- (instancetype)initWithReportId:(NSUInteger )reportId
                         OrderNo:(NSString *)orderNo
                   ReportContent:(NSString *)reportContent
                   ReportedPhone:(NSString *)reportedPhone
                     ReportPhone:(NSString *)reportPhone
{
    self = [super init];
    if (self) {
        self.reportId = reportId;
        self.orderNo = orderNo;
        self.reportContent = reportContent;
        self.reportedPhone = reportedPhone;
        self.reportPhone = reportPhone;
    }
    return self;
}

+ (instancetype)paramWithReportId:(NSUInteger )reportId
                          OrderNo:(NSString *)orderNo
                    ReportContent:(NSString *)reportContent
                    ReportedPhone:(NSString *)reportedPhone
                      ReportPhone:(NSString *)reportPhone
{
    return [[self alloc]initWithReportId:reportId OrderNo:orderNo ReportContent:reportContent ReportedPhone:reportedPhone ReportPhone:reportPhone];
}

@end
