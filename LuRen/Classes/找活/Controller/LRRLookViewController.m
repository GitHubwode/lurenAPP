//
//  LRRLookViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLookViewController.h"
#import "LRRSegmentBarVC.h"
#import "LRRPackWorkViewController.h"
#import "LRRPointWorkViewController.h"

@interface LRRLookViewController ()<UIScrollViewDelegate>

@property (nonatomic,weak) LRRSegmentBarVC * segmentVC;//

//@property (nonatomic, strong) NSArray<NSString *> *titles;
//@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UISegmentedControl *segmentedControl;



@end

@implementation LRRLookViewController

#pragma mark - segmentVC
- (LRRSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LRRSegmentBarVC *vc = [[LRRSegmentBarVC alloc]init];
        // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LRRViewBackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self customNavItem];
}

- (void) customNavItem {
//     1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0, 0, 110, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"点工", @"点包"];
    LRRPointWorkViewController *pointVC = [[LRRPointWorkViewController alloc] init];
    LRRPackWorkViewController *packVC = [[LRRPackWorkViewController alloc] init];
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[pointVC,packVC]];
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updataWithConfig:^(LRRSegmentBarConfig *config) {
        config.itemNormalColor(UIColorHex(0x444444)).itemSelectColor(UIColorHex(0xffffff));
    }];
}

#pragma makr -蓝记载

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    LRRLogFunc;
}


@end
