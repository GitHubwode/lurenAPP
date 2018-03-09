//
//  LRRTeamViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRTeamField.h"
@class LRRCustomInfoItem;

@interface LRRTeamViewCell : UITableViewCell
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
@property (weak, nonatomic) IBOutlet LRRTeamField *textField;

+ (NSString *)cellIdentifier;

@end
