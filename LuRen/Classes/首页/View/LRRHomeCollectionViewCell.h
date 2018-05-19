//
//  LRRHomeCollectionViewCell.h
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRRUserMessageModel;
@interface LRRHomeCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) LRRUserMessageModel *model;
+ (NSString *)homeCollectionIdentifier;

@end
