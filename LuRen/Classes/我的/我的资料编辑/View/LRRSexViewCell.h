//
//  LRRSexViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRSexField.h"
@class LRRCustomInfoItem;

@interface LRRSexViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LRRSexField *textField;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;

+ (NSString *)cellIdentifier;

@end
