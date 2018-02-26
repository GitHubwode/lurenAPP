//
//  LRRTabBarBigButton.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRTabBarBigButton.h"

@interface LRRTabBarBigButton ()

/** 背景 */
@property (nonatomic, weak) UIView *bgView;

@end

@implementation LRRTabBarBigButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 2.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        UIView *bgView = [[UIView alloc] init];
        if (iPhoneX) {
            bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_IrregularX"]];
        } else {
            bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_Irregular"]];
        }
        
        [self insertSubview:bgView atIndex:0];
        self.bgView = bgView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.dl_x = 0;
    self.titleLabel.dl_width = self.dl_width;
    self.titleLabel.dl_height = 16;
    if (@available(iOS 11.0, *)) {
        self.titleLabel.dl_height -= 1;
    }
    
    self.titleLabel.dl_y = self.dl_height - self.titleLabel.dl_height;
    self.imageView.dl_width = self.currentImage.size.width;
    self.imageView.dl_height = self.currentImage.size.height;
    self.imageView.dl_x = (self.dl_width - self.imageView.dl_width)/ 2;
    self.imageView.dl_y = self.titleLabel.dl_y - self.imageView.dl_height - 10;
    
    self.bgView.dl_width = 43;
    self.bgView.dl_height = self.dl_height;
    self.bgView.dl_x = (self.dl_width - self.bgView.dl_width) / 2;
    self.bgView.dl_y = 0;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
