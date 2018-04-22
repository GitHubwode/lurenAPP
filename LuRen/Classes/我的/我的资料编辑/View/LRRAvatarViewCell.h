//
//  LRRAvatarViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRRCustomInfoItem;
@interface LRRAvatarViewCell : UITableViewCell
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;

+ (NSString *)cellIdentifier;


@end
