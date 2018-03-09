//
//  LRRAgeField.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRAgeFieldDelegate <NSObject>
@optional
- (void)ensureButtonClicked;
@end

@interface LRRAgeField : UITextField

@property (nonatomic, weak) id<LRRAgeFieldDelegate> ageDelegate;


@end
