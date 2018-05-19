//
//  LRRUserDetailedView.h
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRRUserMessageModel;

@interface LRRUserDetailedView : UIView
/** 从其他页面跳入 */
@property (nonatomic, strong) LRRUserMessageModel *userMessageModel;
/** 从我的页面跳入为1 其他的都是2 */
@property (nonatomic, assign) NSUInteger isUser;

- (void)lrr_ChangeuUpdateUserMessage;

@end
