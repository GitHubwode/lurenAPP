//
//  LRRNationalField.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRNationalFieldDelegate <NSObject>
@optional
- (void)ensureButtonClicked;
@end

@interface LRRNationalField : UITextField

@property (nonatomic, weak) id<LRRNationalFieldDelegate> nationalDelegate;


@end
