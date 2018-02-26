//
//  LRRHomeCollectionReusableView.h
//  LuRen
//
//  Created by Ding on 2018/1/19.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRRHomeCollectionReusableViewDelegate <NSObject>

- (void)selectedButtonClick:(UIButton *)sender;

@end

@interface LRRHomeCollectionReusableView : UICollectionReusableView

@property (nonatomic, weak) id <LRRHomeCollectionReusableViewDelegate>delegate;


+ (NSString *)identifier;

@end
