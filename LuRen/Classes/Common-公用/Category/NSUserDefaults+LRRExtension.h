//
//  NSUserDefaults+LRRExtension.h
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (LRRExtension)

+ (void)setObject:(id)value forKey:(NSString *)defaultName;
+ (id)objectForKey:(NSString *)defaultName;
+ (BOOL)synchronize;
+ (void)removeObjectForKey:(NSString *)defaultName;

@end
