//
//  LRRPublishWriteViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LRRCustomInfoItem;

@interface LRRPublishWriteViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;

@end
