//
//  LRRSettingViewController.h
//  LuRen
//
//  Created by Ding on 2018/1/18.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBaseViewController.h"

typedef void(^SettingBackLock)(void);

@interface LRRSettingViewController : LRRBaseViewController

@property (nonatomic, copy) SettingBackLock backBlock;

@end
