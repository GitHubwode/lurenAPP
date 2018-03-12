//
//  LRRPublishLiveViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRCustomInfoItem.h"

@interface LRRPublishLiveViewCell : UITableViewCell

@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;

@end
