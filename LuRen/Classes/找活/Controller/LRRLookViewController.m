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
//    self.navigationItem.titleView = self.segmentedControl;
//    [self.view addSubview:self.scrollView];
//    [self setupChildViewControllers];
}

//#pragma mark - 创建控制器
//- (void)setupChildViewControllers
//{
//    LRRPointWorkViewController *pointVC = [[LRRPointWorkViewController alloc] init];
//    LRRPackWorkViewController *packVC = [[LRRPackWorkViewController alloc] init];
//    [self addChildViewController:pointVC];
//    [self addChildViewController:packVC];
//    pointVC.view.frame = CGRectMake(0, 0, kMainScreenWidth,kMainScreenHeight-kNaviHeight);
//    packVC.view.frame = CGRectMake(kMainScreenWidth, 0, kMainScreenWidth,kMainScreenHeight-kNaviHeight);
//    [self.scrollView addSubview:pointVC.view];
//    [self.scrollView addSubview:packVC.view];
//    
//}

//- (void)segmentedControlAction:(UISegmentedControl *)sender
//{
//    [self.scrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex * kMainScreenWidth, 0) animated:NO];
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSInteger n = scrollView.contentOffset.x / scrollView.frame.size.width;
//    self.segmentedControl.selectedSegmentIndex = n;
//}


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
//- (UIScrollView *)scrollView
//{
//    if (!_scrollView) {
//        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight)];
//        _scrollView.delegate = self;
//        _scrollView.contentSize = CGSizeMake(2*kMainScreenWidth, kMainScreenHeight);
//        _scrollView.pagingEnabled = YES;
//        _scrollView.bounces = NO;
//    }
//
//    return _scrollView;
//}

//- (UISegmentedControl *)segmentedControl
//{
//    if (!_segmentedControl) {
//        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"点工",@"点包"]];
//        _segmentedControl.frame = CGRectMake(0, 0, 110, 35);
//        _segmentedControl.momentary = NO;
//        _segmentedControl.selectedSegmentIndex = 0;
//        _segmentedControl.tintColor = LRROrangeThemeColor;
//        //通过Attribute字符串属性字典设置Segment标签属性(正常状态下)
//        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:LRRFont(17),NSForegroundColorAttributeName:UIColorHex(0x444444)} forState:UIControlStateNormal];
////        通过Attribute字符串属性字典设置Segment标签属性(选中状态下)
//        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:LRRFont(17),NSForegroundColorAttributeName:UIColorHex(0xffffff)} forState:UIControlStateSelected];
//
//        [_segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
//    }
//    return _segmentedControl;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    LRRLogFunc;
}


@end
