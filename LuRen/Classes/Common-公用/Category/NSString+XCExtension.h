//
//  NSString+XCExtension.h
//  sunvhui
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XCExtension)

/**
 根据最大宽度和字号，获取文字的尺寸

 @param font 字号
 @param maxW 最大宽度
 @return 尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 获根据字号，获取文字的尺寸

 @param font 字号
 @return 尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font;

/** 对字符串进行md5加密 */
- (NSString *)md5String;

- (NSString*)base64_encode;
- (NSString *)base64_decode;

/** 判断是不是手机号码 */
- (BOOL)isPhoneNumer;

- (NSString *)stringByTrim;
+ (NSString *)stringWithUTF32Char:(UTF32Char)char32;

+ (NSString *)stringPerpenNumber:(NSString *)number;
/**  保存Token 的路径 */
+ (NSString *)snh_documentDirectoryPath;

//时间戳转换为所需要的样式
+(NSString *)TimeStamp:(NSString *)strTime;
//计算预约时间距离现在还剩多久
+(NSString *)getNowTimeWithString:(NSString *)aTimeString;

- (NSString*)encodeString;
-(NSString *)decodeString;
@end
