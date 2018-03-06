//
//  LRRSegmentBarVC.h
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRSegmentBar.h"

@interface LRRSegmentBarVC : UIViewController

@property (nonatomic, weak) LRRSegmentBar *segmentBar;
- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;


@end
