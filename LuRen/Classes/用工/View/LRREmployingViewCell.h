//
//  LRREmployingViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/10.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LRRUserMessageModel;
@interface LRREmployingViewCell : UITableViewCell

@property (nonatomic, strong) LRRUserMessageModel *model;
+ (NSString *)employIdentifier;

@end
