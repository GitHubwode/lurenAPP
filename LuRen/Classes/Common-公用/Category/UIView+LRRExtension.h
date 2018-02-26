//
//  UIView+LRRExtension.h
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LRRExtension)

/** 控件的尺寸 */
@property (nonatomic, assign) CGSize dl_size;

/** 控件宽度 */
@property (nonatomic, assign) CGFloat dl_width;

/** 控件高度 */
@property (nonatomic, assign) CGFloat dl_height;

/** 控件的X值 */
@property (nonatomic, assign) CGFloat dl_x;

/** 控件的Y值 */
@property (nonatomic, assign) CGFloat dl_y;

/** 控件中心点的X值 */
@property (nonatomic, assign) CGFloat dl_centerX;

/** 控件中心点的Y值 */
@property (nonatomic, assign) CGFloat dl_centerY;

/** 控件距离父控件的右侧距离 */
@property (nonatomic, assign) CGFloat dl_right;

/** 控件距离父控件的底部距离 */
@property (nonatomic, assign) CGFloat dl_bottom;

/**
 从xib加载一个控件
 
 @return 这个类的一个控件对象
 */
+ (instancetype)viewFromXib;

- (void)removeAllSubViews;

@end
