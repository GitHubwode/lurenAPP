//
//  LRRWorkViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRWorkField.h"

@class LRRCustomInfoItem;

@interface LRRWorkViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LRRWorkField *textField;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;


@end
