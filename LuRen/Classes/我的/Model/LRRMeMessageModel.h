//
//  LRRMeMessageModel.h
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRRMeMessageModel : NSObject

@property (nonatomic, copy) NSString *iconString;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *linkVC;
@property (nonatomic, copy) NSString *subTitleString;
@property (nonatomic, copy) NSString *statusString;
@property (nonatomic, assign) BOOL isTitle;
@property (nonatomic, assign) BOOL isStatus;

@end
