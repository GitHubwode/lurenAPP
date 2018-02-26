//
//  LRRBaseNavigationController.m
//  LuRen
//
//  Created by Ding on 2018/1/15.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBaseNavigationController.h"

@interface LRRBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation LRRBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    // Do any additional setup after loading the view.
}

/** 设置导航栏标题字体和颜色 */
- (void)setUpNavigationBar
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    if (@available(iOS 8.2, *)) {
        [navigationBar setTitleTextAttributes:@{NSFontAttributeName : LRRMediumFont(17),NSForegroundColorAttributeName: LRRTitleTextColor}];
    } else {
        // Fallback on earlier versions
    }
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    navigationBar.shadowImage = [UIImage new];
}

/** 设置导航栏item字体和颜色 */
- (void)setUpBarButtonItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    if (@available(iOS 8.2, *)) {
        [item setTitleTextAttributes:@{NSFontAttributeName: LRRLightFont(15),NSForegroundColorAttributeName: LRRTitleTextColor} forState:UIControlStateNormal];
    } else {
        // Fallback on earlier versions
    }
    if (@available(iOS 8.2, *)) {
        [item setTitleTextAttributes:@{NSFontAttributeName: LRRLightFont(15), NSForegroundColorAttributeName: LRRContentTextColor} forState:UIControlStateHighlighted];
    } else {
        // Fallback on earlier versions
    }
    if (@available(iOS 8.2, *)) {
        [item setTitleTextAttributes:@{NSFontAttributeName: LRRLightFont(15), NSForegroundColorAttributeName: LRRItemSeletedColor} forState:UIControlStateDisabled];
    } else {
        // Fallback on earlier versions
    }
}

/*  重写push方法的目的 : 拦截所有push进来的子控制器
 *
 *  @param viewController 刚刚push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果viewController不是最早push进来的子控制器
        // 左上角
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
        //        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 所有设置搞定后, 再push控制器
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)dealloc
{
    LRRLogFunc
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    
    return self.topViewController;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
