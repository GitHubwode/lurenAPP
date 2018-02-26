//
//  UIImage+LRRExtension.h
//  LuRen
//
//  Created by Ding on 2018/2/26.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>


@interface UIImage (LRRExtension)

/**
 *  vImage模糊图片
 *
 *  @param image 原始图片
 *  @param blur  模糊数值(0-1)
 *
 *  @return 重新绘制的新图片
 */
+(UIImage *)LRR_boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
