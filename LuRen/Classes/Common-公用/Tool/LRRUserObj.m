//
//  LRRUserObj.m
//  LuRen
//
//  Created by Ding on 2018/3/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRUserObj.h"

@implementation LRRUserObj
MJCodingImplementation
/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"userId": @"id",@"relayName":@"name"};
}

/**
 *  当字典转模型完毕时调用
 */
- (void)mj_keyValuesDidFinishConvertingToObject{
    
    if ([_sex isEqualToString:@"MAN"] || [_sex isEqualToString:@"WOMAN"]) {
        _sexName = [_sex isEqualToString:@"MAN"] ? @"男" :@"女";
    }else{
        _sexName = _sex;
    }
    
    _avatarUrl = [NSString stringWithFormat:@"https:%@",_avatarUrl];
    
    _isLocked = [_isLock isEqualToString:@"N"] ? NO : YES;
    _isDeleted = [_isDelete isEqualToString:@"N"] ? NO : YES;
    _isRealnameed = _isRealname == nil ?NO : YES;
    //隐藏电话点好
    _hidePhone = [NSString numberSuitScanf:_phone];
}

@end

@implementation LRRUserInfo
MJCodingImplementation



@end

