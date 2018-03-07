//
//  LRRLRRServiceCenterHeaderCell.h
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRRServiceCenterModel;

@interface LRRLRRServiceCenterHeaderCell : UITableViewCell

@property (nonatomic, strong) LRRServiceCenterModel *centerModel;

+ (NSString *)serviceCenterIdentifier;

@end
