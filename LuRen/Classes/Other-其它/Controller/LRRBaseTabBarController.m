//
//  LRRBaseTabBarController.m
//  LuRen
//
//  Created by Ding on 2018/1/15.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBaseTabBarController.h"
#import "LRRBaseNavigationController.h"
#import "LRRHomeViewController.h"
#import "LRRFriendViewController.h"
#import "LRRFoundViewController.h"
#import "LRRLookViewController.h"
#import "LRRMeViewController.h"
#import "LRREmployingViewController.h"

#import "LRRTabBar.h"

#define kTabbarHeight ([UIScreen mainScreen].bounds.size.height == 812 ? (LRRDangerousAreaH + 49) : 49)

@interface LRRBaseTabBarController ()<LRRTabBarDelegate,UITabBarControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, assign) NSInteger lastSelectIndex;
@property (nonatomic, strong) UIView *redPoint;
/** view */
@property (nonatomic, strong) LRRTabBar *mytabbar;

@property (nonatomic, strong) id popDelegate;
/** 保存所有控制器对应按钮的内容（UITabBarItem）*/
@property (nonatomic, strong) NSMutableArray *items;


@end

@implementation LRRBaseTabBarController

+ (void)initialize
{
    //设置tabbarItem普通的文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = UIColorHex(666666);
    textAttrs[NSFontAttributeName] = LRRFont(10);

    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = LRROrangeThemeColor;

    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBar.hidden = YES;
    // 把系统的tabBar上的按钮干掉
    [self.tabBar removeFromSuperview];
    // 把系统的tabBar上的按钮干掉
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[LRRTabBar class]]) {
            [childView removeFromSuperview];
            
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    
    // 自定义tabBar
    [self setUpTabBar];
    
    
    // Do any additional setup after loading the view.
    /**** 设置所有UITabBarItem的文字属性 ****/
//    [self setupItemTitleTextAttributes];
    
    
}

#pragma mark - 自定义tabBar
- (void)setUpTabBar {
    LRRTabBar *tabBar = [[LRRTabBar alloc] init];
    // 存储UITabBarItem
    tabBar.items = self.items;
    
    tabBar.delegate = self;
    
    if (iPhoneX) {
        tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_backgroundX"]];
    } else {
        tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_background"]];
    }
    //    tabBar.frame = self.tabBar.frame;
    tabBar.frame = CGRectMake(0, kMainScreenHeight - kTabbarHeight, kMainScreenWidth, kTabbarHeight);
    [self.view addSubview:tabBar];
    self.mytabbar = tabBar;
}

/**
 *  设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes{
    
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttrs[NSForegroundColorAttributeName] = UIColorHex(666666);
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = LRROrangeThemeColor;
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

/**
 *  添加子控制器
 */
- (void)setupChildViewControllers{
    
    [self setupOneChildViewController:[[LRRHomeViewController alloc]init] title:@"优工派" image:@"icon_zhuye" selectedImage:@"icon_zhuye_pressed"];
    
    [self setupOneChildViewController:[[LRRFriendViewController alloc]init] title:@"朋友" image:@"tabbar_icon_chat" selectedImage:@"tabbar_icon_chat_pressed"];
    
//    [self setupOneChildViewController:[[LRRLookViewController alloc]init] title:@"找活" image:@"icon_zhaohuo" selectedImage:@"icon_zhaohuo_pressed"];
    [self setupOneChildViewController:[[LRREmployingViewController alloc]init] title:@"用工" image:@"icon_zhaohuo" selectedImage:@"icon_zhaohuo_pressed"];
    
    
    [self setupOneChildViewController:[[LRRFoundViewController alloc]init] title:@"发现" image:@"icon_faxian" selectedImage:@"icon_faxian_pressed"];
    
    [self setupOneChildViewController:[[LRRMeViewController alloc]init] title:@"我的" image:@"tabbar_icon_wode" selectedImage:@"tabbar_icon_wode_pressed"];
}

/**
 *  初始化一个子控制器
 *
 *  @param vc            子控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中的图标
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    if (image.length) { // 图片名有具体值
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    // 记录所有控制器对应按钮的内容
    [self.items addObject:vc.tabBarItem];
    // 添加为tabbar控制器的子控制器
    LRRBaseNavigationController *nav = [[LRRBaseNavigationController alloc] initWithRootViewController:vc];
    nav.delegate = self;
    
    [self addChildViewController:nav];
}

#pragma mark - BXTabBarDelegate方法
// 监听tabBar上按钮的点击
- (void)tabBar:(LRRTabBar *)tabBar didClickBtn:(NSInteger)index
{
    [super setSelectedIndex:index];
}

/**
 *  让myTabBar选中对应的按钮
 */
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    // 通过mytabbar的通知处理页面切换
    self.mytabbar.seletedIndex = selectedIndex;
}

#pragma mark navVC代理
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *root = navigationController.viewControllers.firstObject;
    self.tabBar.hidden = YES;
    if (viewController != root) {
        //        if (navigationController.viewControllers.count > 2) return;
        //从HomeViewController移除
        [self.mytabbar removeFromSuperview];
        // 调整tabbar的Y值
        CGRect dockFrame = self.mytabbar.frame;
        
        dockFrame.origin.y = root.view.frame.size.height - kTabbarHeight;
        if ([root.view isKindOfClass:[UIScrollView class]]) { // 根控制器的view是能滚动
            UIScrollView *scrollview = (UIScrollView *)root.view;
            dockFrame.origin.y += scrollview.contentOffset.y;
        }
        self.mytabbar.frame = dockFrame;
        // 添加dock到根控制器界面
        [root.view addSubview:self.mytabbar];
    }
}

// 完全展示完调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *root = navigationController.viewControllers.firstObject;
    LRRBaseNavigationController *nav = (LRRBaseNavigationController *)navigationController;
    if (viewController == root) {
        // 更改导航控制器view的frame
        //        navigationController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabbarHeight);
        
        navigationController.interactivePopGestureRecognizer.delegate = nav.popDelegate;
        // 让Dock从root上移除
        [_mytabbar removeFromSuperview];
        
        //_mytabbar添加dock到HomeViewController
        //        _mytabbar.frame = self.tabBar.frame;
        _mytabbar.frame = CGRectMake(0, kMainScreenHeight - kTabbarHeight, kMainScreenWidth, kTabbarHeight);
        [self.view addSubview:_mytabbar];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
