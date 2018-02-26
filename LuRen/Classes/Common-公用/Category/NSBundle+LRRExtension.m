//
//  NSBundle+LRRExtension.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "NSBundle+LRRExtension.h"

@implementation NSBundle (LRRExtension)
+ (NSString *)currentVersion{
    return [self mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

@end
