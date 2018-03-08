//
//  LRRCityField.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRCityFieldDelegate <NSObject>
@optional
- (void)ensureButtonClicked;
@end

@interface LRRCityField : UITextField

@property (nonatomic, weak) id<LRRCityFieldDelegate> cityDelegate;

@end
