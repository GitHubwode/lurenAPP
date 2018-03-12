//
//  LRRPublishedWorkViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishedWorkViewController.h"
#import "LRRSlideSwitchView.h"
#import "LRRPublishPointViewController.h"
#import "LRRPublishPackViewController.h"


@interface LRRPublishedWorkViewController ()<LRRSlideSwitchViewDelegate>

@property (nonatomic, strong) LRRSlideSwitchView *slideSwitchView;
@property (nonatomic, strong) NSArray<NSString *> *titles;


@end

@implementation LRRPublishedWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布招工";
    [self setupChildViewControllers];
    [self setUpSlideSwitchView];
}

- (void)setUpSlideSwitchView{
    _slideSwitchView = [[LRRSlideSwitchView alloc]initWithFrame:self.view.bounds heightOfTopScrollView:44.f];
    _slideSwitchView.backgroundColor = LRRTitleTextColor;
    _slideSwitchView.dl_y += 10.f;
    _slideSwitchView.dl_height -= (64.f + 10.f);
    _slideSwitchView.slideSwitchViewDelegate = self;
    _slideSwitchView.topScrollView.backgroundColor = [UIColor whiteColor];
    _slideSwitchView.tabItemNormalColor = LRRTitleTextColor;
    _slideSwitchView.kFontSizeOfTabButton = 14;
    _slideSwitchView.tabItemSelectedColor = LRRTitleTextColor;
    _slideSwitchView.widthOfButtonMargin = 22.f;
    _slideSwitchView.tabItemNormalBackgroundImage = [UIImage imageNamed:@"btn_choose"];
    _slideSwitchView.tabItemSelectedBackgroundImage = [UIImage imageNamed:@"btn_choose_pressed"];
    [_slideSwitchView buildUI];
    [self.view addSubview:_slideSwitchView];
}

- (void)setupChildViewControllers{
    
    LRRPublishPointViewController *firstVC = [[LRRPublishPointViewController alloc]init];
    //    waitting.requestType = 0;
    [self addChildViewController:firstVC];
    
    LRRPublishPackViewController *secondVC = [[LRRPublishPackViewController alloc]init];
    //    checked.requestType = 1;
    [self addChildViewController:secondVC];
    
    
    _titles = @[@"点工", @"点包",];
}

#pragma mark - LRRSlideSwitchViewDelegate
- (NSUInteger)numberOfTab:(LRRSlideSwitchView *)view{
    return self.childViewControllers.count;
}

- (UIViewController *)slideSwitchView:(LRRSlideSwitchView *)view viewOfTab:(NSUInteger)number{
    return self.childViewControllers[number];
}

- (NSString *)slideSwitchView:(LRRSlideSwitchView *)view titleOfTab:(NSUInteger)number{
    return _titles[number];
}

- (void)dealloc
{
    LRRLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
