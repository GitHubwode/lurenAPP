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
    
    switch (_type) {
        case 1:
            _workerType = @"木工";
            break;
        case 2:
            _workerType = @"钢筋工";
            break;
        case 3:
            _workerType = @"内架子工";
            break;
        case 4:
            _workerType = @"外架子工";
            break;
        case 5:
            _workerType = @"泥工";
            break;
        case 6:
            _workerType = @"水电工";
            break;
        case 7:
            _workerType = @"电焊工";
            break;
        case 8:
            _workerType = @"小工";
            break;
        default:
            break;
    }
    
    //    人数
    if (_fare == 0) {
        _orderDetails = [NSString stringWithFormat:@"订单详情:%@%lu人, 工作%lu天,每天工作%@小时 每天%.f元,无车费。",_workerType,(unsigned long)_number,(unsigned long)_days,_whenLong,_unitPrice];
        _searchOrderDetails =[NSString stringWithFormat:@"订单详情:%@%lu人, 工作%lu天,每天工作%@小时 无车费。",_workerType,(unsigned long)_number,(unsigned long)_days,_whenLong];
    }else{
        _orderDetails = [NSString stringWithFormat:@"订单详情:%@%lu人, 工作%lu天,每天工作%@小时 每天%.f元,车费%.f元。",_workerType,(unsigned long)_number,(unsigned long)_days,_whenLong,_unitPrice,_fare];
        
        _searchOrderDetails = [NSString stringWithFormat:@"订单详情:%@%lu人, 工作%lu天,每天工作%@小时",_workerType,(unsigned long)_number,(unsigned long)_days,_whenLong];
        
    }
    _differentPrice = [NSString stringWithFormat:@"%.f",(_totalAmount - _fee)];
    
    LRRLog(@"价钱 %.f %.f  %@",_totalAmount,_fee,_differentPrice);
    
    //隐藏电话点好
    _hidePhone = [NSString numberSuitScanf:_contactsPhone];
    
    //头像地址
    if (_avatarUrl.length > 0) {
        _avatarUrl = [NSString stringWithFormat:@"https:%@",_avatarUrl];
    }
    _accpetTime = [NSString TimeStamp:_accpetTime];
    _workStartTime = [NSString OrderDetailsTimeStamp:_workStartTime];
    _payTime = [NSString TimeStamp:_payTime];
    if (_orderUrl.length != 0) {
        _imageArray =[[_orderUrl componentsSeparatedByString:@","] mutableCopy];
    }
    if (_instance.length > 0) {
        _instance = [NSString getDistanceString:_instance];
    }
}

/**
 *  这个数组中的属性名将会被忽略：不进行字典和模型的转换
 */
+ (NSArray *)mj_ignoredPropertyNames{
    return @[@"orderDetails", @"workerType",@"searchOrderDetails",@"statusImage",@"differentPrice",@"hidePhone",@"imageArray"];
}


@end
