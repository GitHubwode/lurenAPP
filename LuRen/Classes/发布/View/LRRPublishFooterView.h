//
//  LRRPublishFooterView.h
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRPublishFooterDelegate <NSObject>
@optional
- (void)ensurePublshButtonClicked;
@end

@interface LRRPublishFooterView : UIView

@property (nonatomic, weak) id<LRRPublishFooterDelegate> footerDelegate;

@end
