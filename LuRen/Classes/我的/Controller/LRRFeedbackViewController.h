//
//  LRRFeedbackViewController.h
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBaseViewController.h"

@interface LRRFeedbackViewController : LRRBaseViewController

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *orderNo;
/** 被举报人电话 */
@property (nonatomic, copy) NSString *reportedPhone;

@end
