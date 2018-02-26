//
//  LRRMeTableViewCell.h
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LRRMeMessageModel;

@interface LRRMeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) LRRMeMessageModel *item;

+ (NSString *)meTableCellIdentifier;

@end
