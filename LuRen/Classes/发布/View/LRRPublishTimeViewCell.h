//
//  LRRPublishTimeViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRChooseTimeField.h"

@class LRRCustomInfoItem;

@interface LRRPublishTimeViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LRRChooseTimeField *textField;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;

@end
