//
//  LRRMeHeaderView.h
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRHeaderViewDelegate <NSObject>

- (void)headerViewTapMessage;

@end

@interface LRRMeHeaderView : UIView

@property (nonatomic, weak) id<LRRHeaderViewDelegate> delegate;


@end
