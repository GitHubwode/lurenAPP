//
//  LRRSexField.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRSexFieldDelegate <NSObject>

@optional
- (void)ensureButtonClicked;

@end

@interface LRRSexField : UITextField

@property (nonatomic, weak) id<LRRSexFieldDelegate> sexDelegate;

@end
