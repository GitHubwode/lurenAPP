//
//  LRRChooseTimeField.h
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRChooseTimeFieldDelegate <NSObject>
@optional
- (void)ensureButtonClicked;
@end

@interface LRRChooseTimeField : UITextField

@property (nonatomic, weak) id<LRRChooseTimeFieldDelegate> chooseTimeDelegate;


@end
