//
//  LRRNationalViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRNationalField.h"
@class LRRCustomInfoItem;


@interface LRRNationalViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LRRNationalField *textField;

@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;


@end
