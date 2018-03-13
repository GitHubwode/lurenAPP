//
//  LRRRefreshHeader.m
//  LuRen
//
//  Created by Ding on 2018/3/13.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRRefreshHeader.h"

@implementation LRRRefreshHeader

- (void)prepare
{
    [super prepare];
}

+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    LRRRefreshHeader *header = [super headerWithRefreshingTarget:target refreshingAction:action];
    header.lastUpdatedTimeLabel.hidden = NO;
    header.stateLabel.hidden = NO;
    return header;
}

@end
