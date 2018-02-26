//
//  NSUserDefaults+LRRExtension.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "NSUserDefaults+LRRExtension.h"

@implementation NSUserDefaults (LRRExtension)

+ (void)setObject:(id)value forKey:(NSString *)defaultName{
    [[self standardUserDefaults] setObject:value forKey:defaultName];
}

+ (id)objectForKey:(NSString *)defaultName{
    return   [[self standardUserDefaults] objectForKey:defaultName];
}

+ (BOOL)synchronize{
    return [[self standardUserDefaults] synchronize];
}

+ (void)removeObjectForKey:(NSString *)defaultName{
    [[self standardUserDefaults] removeObjectForKey:defaultName];
}

@end
