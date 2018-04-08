//
//  LRRRongCloudModel.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRRongCloudModel.h"
#import <RongIMKit/RongIMKit.h>
#import "LRRLoginRequestManager.h"

@implementation LRRRongCloudModel

+ (void)lrr_initRongCloudAppkey
{
    [[RCIM sharedRCIM]initWithAppKey:LRRRongCloudAppKey];
    [RCIM sharedRCIM].disableMessageAlertSound = NO;
    [RCIM sharedRCIM].enableTypingStatus = YES;
    [RCIM sharedRCIM].enablePersistentUserInfoCache = YES;
    [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
    [RCIM sharedRCIM].globalConversationAvatarStyle = RC_USER_AVATAR_CYCLE;
}
+ (void)lrr_initRongCloudLogin
{
    NSString *identityString;
    if ([LRRUserManager sharedUserManager].logined) {
        identityString = [LRRUserManager sharedUserManager].currentUser.type;
    }else{
        identityString = @"WORKER";
    }
//    NSString *isJPush;
//    isJPush = [NSUserDefaults objectForKey:LRRJPushType];
    
//    NSSet * set = [[NSSet alloc] initWithObjects:identityString, nil];
    
    [LRRLoginRequestManager setupUserRongTokencompletion:^(LRRResponseObj *responseObj) {
        
        if (!responseObj) {
            
        }else if ([responseObj.data isKindOfClass:[NSString  class]]){
            
//            if ([isJPush isEqualToString:@"NO"]) {
//            }else{
//                [[KGGJPushManager shareJPushManager] cmd_registerAliasPhone:[KGGUserManager shareUserManager].currentUser.phone];
//                //注册标签
//                [[KGGJPushManager shareJPushManager] cmd_registerTags:set];
//            }
            
            [[RCIMClient sharedRCIMClient]connectWithToken:responseObj.data success:^(NSString *userId) {
                LRRLog(@"融云登录成功");
                RCUserInfo *userInfo = [[RCUserInfo alloc]init];
                userInfo.name = [LRRUserManager sharedUserManager].currentUser.nickname;
                userInfo.userId = [LRRUserManager sharedUserManager].currentUser.userId;
                userInfo.portraitUri = [LRRUserManager sharedUserManager].currentUser.avatarUrl;
                [[RCIM sharedRCIM] setCurrentUserInfo:userInfo];
                [[RCIM sharedRCIM]setEnableMessageAttachUserInfo:YES];
            } error:^(RCConnectErrorCode status) {
                LRRLog(@"融云登录失败");
                
            } tokenIncorrect:^{
                LRRLog(@"token过期");
                
            }];
        }
        
    } aboveView:nil inCaller:self];
}

@end
