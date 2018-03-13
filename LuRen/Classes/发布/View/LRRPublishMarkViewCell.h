//
//  LRRPublishMarkViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/13.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRRCustomInfoItem;

@interface LRRPublishMarkViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
+ (NSString *)cellIdentifier;

@end
