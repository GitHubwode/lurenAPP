//
//  LRRLookTableViewCell.h
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRROrderDetailsModel;
@interface LRRLookTableViewCell : UITableViewCell
@property (nonatomic, strong) LRROrderDetailsModel *orderModel;
+ (NSString *)lookIdentifier;

@end
