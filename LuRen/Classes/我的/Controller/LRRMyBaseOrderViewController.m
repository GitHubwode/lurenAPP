//
//  LRRMyBaseOrderViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/5.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRMyBaseOrderViewController.h"
#import "SUNSlideSwitchView.h"
#import "LRRMyOrderListViewController.h"


@interface LRRMyBaseOrderViewController ()<SUNSlideSwitchViewDelegate>

@property (nonatomic, strong) SUNSlideSwitchView *slideSwitchView;
@property (nonatomic, strong) NSArray<NSString *> *titles;

@end

@implementation LRRMyBaseOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的订单";
    self.view.backgroundColor = LRRViewBackgroundColor;
    [self setupChildViewControllers];
    [self setUpSlideSwitchView];
}

- (void)setUpSlideSwitchView{
    _slideSwitchView = [[SUNSlideSwitchView alloc]initWithFrame:self.view.bounds heightOfTopScrollView:44.f];
    _slideSwitchView.backgroundColor = LRRTitleTextColor;
     _slideSwitchView.dl_y += 1.f;
    _slideSwitchView.dl_height -= (64.f + 1.f);
    _slideSwitchView.slideSwitchViewDelegate = self;
    _slideSwitchView.topScrollView.backgroundColor = [UIColor whiteColor];
    _slideSwitchView.tabItemNormalColor = LRRTitleTextColor;
    _slideSwitchView.kFontSizeOfTabButton = 14;
    _slideSwitchView.tabItemSelectedColor = LRROrangeThemeColor;
    _slideSwitchView.widthOfButtonMargin = 22.f;
    _slideSwitchView.shadowImage = [UIImage imageNamed:@"chosebar"];
    [_slideSwitchView buildUI];
    [self.view addSubview:_slideSwitchView];
}

- (void)setupChildViewControllers{
    
    LRRMyOrderListViewController *firstVC = [[LRRMyOrderListViewController alloc]init];
//    waitting.requestType = 0;
    [self addChildViewController:firstVC];
    
    LRRMyOrderListViewController *secondVC = [[LRRMyOrderListViewController alloc]init];
//    checked.requestType = 1;
    [self addChildViewController:secondVC];
    
    LRRMyOrderListViewController *threeVC = [[LRRMyOrderListViewController alloc]init];
    //    checked.requestType = 1;
    [self addChildViewController:threeVC];
    
//    LRRMyOrderListViewController *fourVC = [[LRRMyOrderListViewController alloc]init];
//    //    checked.requestType = 1;
//    [self addChildViewController:fourVC];
    
    
    _titles = @[@"已接单",@"已付款",@"已取消"];
}


#pragma mark - SUNSlideSwitchViewDelegate
- (NSUInteger)numberOfTab:(SUNSlideSwitchView *)view{
    return self.childViewControllers.count;
}

- (UIViewController *)slideSwitchView:(SUNSlideSwitchView *)view viewOfTab:(NSUInteger)number{
    return self.childViewControllers[number];
}

- (NSString *)slideSwitchView:(SUNSlideSwitchView *)view titleOfTab:(NSUInteger)number{
    return _titles[number];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
