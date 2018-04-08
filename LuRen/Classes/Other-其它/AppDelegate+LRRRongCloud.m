//
//  AppDelegate+LRRRongCloud.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "AppDelegate+LRRRongCloud.h"
#import "LRRRongCloudModel.h"
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()<RCIMReceiveMessageDelegate, RCIMConnectionStatusDelegate>

@end

@implementation AppDelegate (LRRRongCloud)

- (void)setUpRongCloud{
    
    [LRRRongCloudModel lrr_initRongCloudAppkey];
    [LRRRongCloudModel lrr_initRongCloudLogin];
    [[RCIM sharedRCIM] setReceiveMessageDelegate:self];
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
}

- (void)onRCIMReceiveMessage:(RCMessage *)message
                        left:(int)left
{
    // 收到消息的通知
    [self updateBadgeValueForTabBarItem];
    LRRLog(@"融云接收到消息通知");
}

- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status
{
    if (status == ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        [LRRNotificationCenter postNotificationName:LRRConnectionStatusOffLine object:nil userInfo:nil];
    }
}

- (void)updateBadgeValueForTabBarItem {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int count = [[RCIMClient sharedRCIMClient]
                     getTotalUnreadCount];
        if (count > 0) {
            [LRRNotificationCenter postNotificationName:LRRShowAlertNotifacation object:nil];
        } else {
            [LRRNotificationCenter postNotificationName:LRRHidenAlertNotifacation object:nil];
        }
    });
}

- (void)logoutNoti{
    [[RCIM sharedRCIM] disconnect:NO];
}


@end
