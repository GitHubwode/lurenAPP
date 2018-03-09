//
//  LRRAgeViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRAgeField.h"
@class LRRCustomInfoItem;

@interface LRRAgeViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet LRRAgeField *textField;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;

@end
