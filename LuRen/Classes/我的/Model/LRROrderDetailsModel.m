//
//  LRROrderDetailsModel.m
//  LuRen
//
//  Created by Ding on 2018/4/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRROrderDetailsModel.h"

@implementation LRROrderDetailsModel

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"orderId": @"id"};
}

/**
 *  当字典转模型完毕时调用
 */
- (void)mj_keyValuesDidFinishConvertingToObject{
    
    _remark = _remark.length == 0 ? @"没有特殊要求":_remark;
    _remark = [_remark stringByReplacingOccurrencesOfString:@"null" withString:@""];
    
    if (_status == 0) {
        _statusImage = @"pic_daijie";
    }else{
        _statusImage = @"pic_yijie";
    }
    
    //    人数
    if (_fare == 0) {
        _totalAmount = _number *_unitPrice*_days;
    }else{
        if ((int)_number < 5) {
            _carNum = 0;
        }else {
            _carNum =ceil(_number/7);
        }
        _totalAmount = _number *_unitPrice*_days + _fare*_days*_carNum;
    }
    
    LRRLog(@"价钱 %.f %.f  %@",_totalAmount,_fee,_differentPrice);
    
    _orderDetails = [NSString stringWithFormat:@"%@ 工种: %@",_address,_type];
    
    //隐藏电话点好
    _hidePhone = [NSString numberSuitScanf:_contactsPhone];
    
    //头像地址
    if (_avatarUrl.length > 0) {
        _avatarUrl = [NSString stringWithFormat:@"https:%@",_avatarUrl];
    }
    _accpetTime = [NSString TimeStamp:_accpetTime];
    _workStartTime = [NSString TimeStamp:_workStartTime];

    if (_instance.length > 0) {
        _instance = [NSString getDistanceString:_instance];
    }
}

/**
 *  这个数组中的属性名将会被忽略：不进行字典和模型的转换
 */
+ (NSArray *)mj_ignoredPropertyNames{
    return @[@"orderDetails", @"workerType",@"searchOrderDetails",@"statusImage",@"differentPrice",@"hidePhone",@"imageArray",@"carNum;"];
}


@end
