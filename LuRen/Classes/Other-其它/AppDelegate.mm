//
//  AppDelegate.m
//  LuRen
//
//  Created by Ding on 2018/1/15.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+LRRGuide.h"
#import "LRRBaseTabBarController.h"
#import "AppDelegate+LRRRongCloud.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件


@interface AppDelegate ()
{
    BMKMapManager *mapManager;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[LRRUserManager sharedUserManager] autoLogin];
    //创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL success = [mapManager start:@"VYVryw7ypGrAURssbGkfeIrwrWnY2xzT"  generalDelegate:nil];
    if (success) {
        LRRLog(@"百度地图定位成功");
    }
    //设置窗口根目录
    [self setUpRootViewControllver];
    //显示窗口
    [self.window makeKeyAndVisible];
    //链接融云
//    [self setUpRongCloud];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
