//
//  LRROrderModel.m
//  LuRen
//
//  Created by Ding on 2018/3/14.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRROrderModel.h"

@implementation LRROrderModel


/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"feedId": @"id"};
}


/**
 *  这个数组中的属性名将会被忽略：不进行字典和模型的转换
 */
+ (NSArray *)mj_ignoredPropertyNames
{
    return @[@"cellHeight", @"cellFullHeight",@"contentF", @"contentFullF",@"bottomToobarHeight", @"pictures",@"pictureUrls", @"pictureThumbnailUrls",@"videoMeta",@"contentLabel",@"stageTotalNum"];
}


/**
 *  当字典转模型完毕时调用
 */
- (void)mj_keyValuesDidFinishConvertingToObject
{
    
}
/** 转换UILabel中显示数字的颜色 */
- (NSAttributedString *)changeTitle:(NSString *)string
{
    NSCharacterSet *charSet = [[NSCharacterSet letterCharacterSet]invertedSet];//创建一个字符串过滤参数,decimalDigitCharacterSet为过滤小数,过滤某个关键词,只需改变 decimalDigitCharacterSet类型  在将此方法增加一个 NSString参数即可
    /**
     以下为NSCharacterSet的过滤类型:
     
     controlCharacterSet; //控制符
     whitespaceCharacterSet; //空格
     whitespaceAndNewlineCharacterSet; //空格和换行符
     decimalDigitCharacterSet; //小数
     letterCharacterSet; //文字
     lowercaseLetterCharacterSet; //小写字母
     uppercaseLetterCharacterSet; //大写字母
     nonBaseCharacterSet; //非基础
     alphanumericCharacterSet; //字母数字
     decomposableCharacterSet; //可分解
     illegalCharacterSet; //非法
     punctuationCharacterSet; //标点
     capitalizedLetterCharacterSet; //大写
     symbolCharacterSet; //符号
     newlineCharacterSet; //换行符
     */ 
    NSInteger remainSeconde = [[string stringByTrimmingCharactersInSet:charSet]intValue];//获取过滤出来的数值
    NSString *stringRange = [NSString stringWithFormat:@"%ld",remainSeconde];//将过滤出来的Integer的值转换成String
    NSRange range = [string rangeOfString:stringRange];//获取过滤出来的数值的位置
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];//创建一个带属性的string
    [attrString addAttribute:NSForegroundColorAttributeName value:LRRMoneyTitleColor range:range];//给带属性的string添加属性,attrubute:添加的属性类型（颜色\文字大小\字体等等）,value:改变成的属性参数,range:更改的位置
    return attrString;
}

@end


























