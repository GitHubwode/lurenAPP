//
//  LRRMyEditViewController.h
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBaseViewController.h"

typedef void(^ChangeUserMessageSuccess)(void);

@interface LRRMyEditViewController : LRRBaseViewController

@property (nonatomic, strong) ChangeUserMessageSuccess backBlock;


@end
