//
//  LRRCityViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRCityField.h"
@class LRRCustomInfoItem;

@interface LRRCityViewCell : UITableViewCell
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
@property (weak, nonatomic) IBOutlet LRRCityField *textField;

+ (NSString *)cellIdentifier;

@end
