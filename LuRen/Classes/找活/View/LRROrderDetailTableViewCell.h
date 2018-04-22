//
//  LRROrderDetailTableViewCell.h
//  LuRen
//
//  Created by Ding on 2018/1/23.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRROrderDetailsModel;


@protocol LRROrderDetailTableViewCellDelegate <NSObject>

- (void)moreChargeStandardButtonClick:(UIButton *)sender;
- (void)orderDetailButtonClick:(UIButton *)sender;

@end

@interface LRROrderDetailTableViewCell : UITableViewCell

@property (nonatomic, weak) id<LRROrderDetailTableViewCellDelegate> delegate;

@property (nonatomic, strong) LRROrderDetailsModel *orderModel;
+ (NSString *)orderDetailIdentifier;

@end
