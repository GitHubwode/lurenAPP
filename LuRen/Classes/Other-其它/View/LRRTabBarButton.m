//
//  LRRTabBarButton.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRTabBarButton.h"

@implementation LRRTabBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
        // 2.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
//    self.badgeView.badgeValue = item.badgeValue;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 文字位置
    self.titleLabel.dl_x = 0;
    self.titleLabel.dl_width = self.dl_width;
    self.titleLabel.dl_height = 16;
    if (@available(iOS 11.0, *)) {
        self.titleLabel.dl_height -= 1;
    }
    self.titleLabel.dl_y = self.dl_height - self.titleLabel.dl_height;
    
    // 图片位置
    //    self.imageView.width = 35;
    //    self.imageView.height = 35;
    //    self.imageView.x = (self.width - self.imageView.width) / 2;
    //    self.imageView.y = 0;
    self.imageView.dl_width = self.currentImage.size.width;
    self.imageView.dl_height = self.currentImage.size.height;
    self.imageView.dl_x = (self.dl_width - self.imageView.dl_width) / 2;
    self.imageView.dl_y = self.titleLabel.dl_y - self.imageView.dl_height - 4;
    
    
    // 小红点位置
//    self.badgeView.dl_x = CGRectGetMaxX(self.imageView.frame) - 5;
//    self.badgeView.dl_y = 2;
    //    self.badgeView.width = ;
    //    self.badgeView.height = ;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
