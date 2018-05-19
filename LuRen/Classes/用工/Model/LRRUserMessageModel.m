//
//  LRRUserMessageModel.m
//  LuRen
//
//  Created by Ding on 2018/5/5.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRUserMessageModel.h"

@implementation LRRUserMessageModel

/**
 *  当字典转模型完毕时调用
 */
- (void)mj_keyValuesDidFinishConvertingToObject
{
    if (_nickname == nil) {
        _nickname = @"哈哈哈";
    }
    
    if ([_sex isEqualToString:@"MAN"]) {
        _sex = @"男";
    }else{
        _sex = @"女";
    }
    
    if ([_avatarUrl containsString:@"https:"]) {
        
    }else{
        _avatarUrl = [NSString stringWithFormat:@"https:%@",_avatarUrl];
    }
    
}

@end
