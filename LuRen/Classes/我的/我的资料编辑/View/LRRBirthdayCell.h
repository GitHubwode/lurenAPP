//
//  LRRBirthdayCell.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRBirthdayField.h"

@class LRRCustomInfoItem;

@interface LRRBirthdayCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LRRBirthdayField *textField;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;


@end
