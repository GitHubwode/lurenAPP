//
//  LRRWorkField.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRWorkFieldDelegate <NSObject>
@optional
- (void)ensureButtonClicked;
@end

@interface LRRWorkField : UITextField

@property (nonatomic, weak) id<LRRWorkFieldDelegate> workDelegate;


@end
