//
//  LRRSettingViewCell.h
//  LuRen
//
//  Created by Ding on 2018/1/18.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRRSettingViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

+ (NSString *)settingIdenfier;

@end
