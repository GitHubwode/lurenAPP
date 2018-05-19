//
//  LRROrderDetailViewController.h
//  LuRen
//
//  Created by Ding on 2018/1/23.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBaseViewController.h"

@class LRROrderDetailsModel;

typedef void(^AcceptOrder)(void);

@interface LRROrderDetailViewController : LRRBaseViewController

@property (nonatomic, strong) LRROrderDetailsModel *orderModel;

@property (nonatomic, copy) NSString *IdString;

@property (nonatomic, copy) AcceptOrder blockOrder;

@end
