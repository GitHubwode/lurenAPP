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

//@property (nonatomic,weak) LRRSegmentBarVC * segmentVC;//

@property (nonatomic, strong) NSArray<NSString *> *titles;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;



@end

@implementation LRRLookViewController

#pragma mark - segmentVC
//- (LRRSegmentBarVC *)segmentVC{
//    if (!_segmentVC) {
//        LRRSegmentBarVC *vc = [[LRRSegmentBarVC alloc]init];
//        // 添加到到控制器
//        [self addChildViewController:vc];
//        _segmentVC = vc;
//    }
//    return _segmentVC;
//}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LRRViewBackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self customNavItem];
    self.navigationItem.titleView = self.segmentedControl;
     [self.view addSubview:self.scrollView];
//    [self creatNavView];
    
    [self setupChildViewControllers];
}

#pragma mark - 创建控制器
- (void)setupChildViewControllers
{
    LRRPointWorkViewController *pointVC = [[LRRPointWorkViewController alloc] init];
    LRRPackWorkViewController *packVC = [[LRRPackWorkViewController alloc] init];
    [self addChildViewController:pointVC];
    [self addChildViewController:packVC];
    pointVC.view.frame = CGRectMake(0, 0, kMainScreenWidth,kMainScreenHeight-kNaviHeight);
    packVC.view.frame = CGRectMake(kMainScreenWidth, 0, kMainScreenWidth,kMainScreenHeight-kNaviHeight);
    [self.scrollView addSubview:pointVC.view];
    [self.scrollView addSubview:packVC.view];
    
}

- (void)segmentedControlAction:(UISegmentedControl *)sender
{
    [self.scrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex * kMainScreenWidth, 0) animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger n = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.segmentedControl.selectedSegmentIndex = n;
}

//#pragma mark - 自定义导航栏
//- (void)creatNavView
//{
//    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kNaviHeight)];
//    bgView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:bgView];
//
//    UIView *titleView = [UIView new];
//    titleView.backgroundColor = [UIColor whiteColor];
//    [bgView addSubview:titleView];
//    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(bgView.mas_centerY).offset(5);
//        make.centerX.equalTo(bgView.mas_centerX);
//        make.height.equalTo(@(35));
//        make.width.equalTo(@(110));
//    }];
//
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button1 setTitle:@"点工" forState:UIControlStateNormal];
//    [button1 setTitleColor:UIColorHex(0x444444) forState:UIControlStateNormal];
//    [button1 setTitleColor:UIColorHex(0xffffff) forState:UIControlStateSelected];
//    [button1 setBackgroundImage:[UIImage imageNamed:@"exitButtonBg"] forState:UIControlStateSelected];
//    [button1 addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [titleView addSubview:button1];
//    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(titleView.mas_centerY);
//        make.left.equalTo(titleView.mas_left).offset(0);
//        make.height.equalTo(@(30));
//        make.width.equalTo(@(60));
//    }];
//
//    [self.view addSubview:self.scrollView];
//
//}



//#pragma mark - 按钮的点击事件
//- (void)leftButtonClick:(UIButton *)sender
//{
//    sender.selected = !sender.selected;
//    LRRPointWorkViewController *pointVC = [[LRRPointWorkViewController alloc] init];
//    [self.navigationController pushViewController:pointVC animated:NO];
//}
//
//- (void) customNavItem {
////     1 设置segmentBar的frame
//    self.segmentVC.segmentBar.frame = CGRectMake(0, 0, 110, 35);
//    self.navigationItem.titleView = self.segmentVC.segmentBar;
//    // 2 添加控制器的View
//    self.segmentVC.view.frame = self.view.bounds;
//    [self.view addSubview:self.segmentVC.view];
//    NSArray *items = @[@"点工", @"点包"];
//    LRRPointWorkViewController *pointVC = [[LRRPointWorkViewController alloc] init];
//    LRRPackWorkViewController *packVC = [[LRRPackWorkViewController alloc] init];
//    // 3 添加标题数组和控住器数组
//    [self.segmentVC setUpWithItems:items childVCs:@[pointVC,packVC]];
//    // 4  配置基本设置  可采用链式编程模式进行设置
//    [self.segmentVC.segmentBar updataWithConfig:^(LRRSegmentBarConfig *config) {
//        config.itemNormalColor(UIColorHex(0x444444)).itemSelectColor(UIColorHex(0xec6b1a));
//    }];
//}

#pragma makr -蓝记载
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(2*kMainScreenWidth, kMainScreenHeight);
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
    }
    
    return _scrollView;
}

- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"点工",@"点包"]];
        _segmentedControl.frame = CGRectMake(0, 0, 110, 35);
        _segmentedControl.momentary = NO;
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.tintColor = LRROrangeThemeColor;
//        [_segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"exitButtonBg"] atIndex:1 animated:YES];
//        [_segmentedControl setImage:[UIImage imageNamed:@"exitButtonBg"] forSegmentAtIndex:1];
        //通过Attribute字符串属性字典设置Segment标签属性(正常状态下)
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:LRRFont(17),NSForegroundColorAttributeName:UIColorHex(0x444444)} forState:UIControlStateNormal];
//        通过Attribute字符串属性字典设置Segment标签属性(选中状态下)
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:LRRFont(17),NSForegroundColorAttributeName:UIColorHex(0xffffff)} forState:UIControlStateSelected];
        
        [_segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    LRRLogFunc;
}


@end
