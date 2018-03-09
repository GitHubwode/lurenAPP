//
//  LRRTeamField.h
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRTeamFieldDelegate <NSObject>
@optional
- (void)ensureButtonClicked;
@end

@interface LRRTeamField : UITextField

@property (nonatomic, weak) id<LRRTeamFieldDelegate> teamDelegate;


@end
