//
//  LRRDefineButton.m
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRDefineButton.h"

@implementation LRRDefineButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect titleF = self.titleLabel.frame;
    CGRect imageF = self.imageView.frame;
    
    titleF.origin.x = 0;
    self.titleLabel.frame = titleF;
    
    imageF.origin.x = CGRectGetMaxX(titleF) + 10;
    self.imageView.frame = imageF;
}

@end
