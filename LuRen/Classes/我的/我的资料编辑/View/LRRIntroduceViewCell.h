//
//  LRRIntroduceViewCell.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LRRCustomInfoItem;


@interface LRRIntroduceViewCell : UITableViewCell
@property (nonatomic, strong) LRRCustomInfoItem *infoItem;
@property (weak, nonatomic) IBOutlet UITextView *subTitleTextView;
+ (NSString *)cellIdentifier;

@end
