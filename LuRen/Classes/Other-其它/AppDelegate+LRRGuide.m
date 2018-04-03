//
//  AppDelegate+LRRGuide.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "AppDelegate+LRRGuide.h"
#import "NSBundle+LRRExtension.h"
#import "LRRBaseTabBarController.h"
#import "LRRChooseIDViewController.h"
#import "LRRBaseTabBarController.h"
#import "LRRBasePublishTabBarController.h"

static NSString * const LRRLastVersionKey = @"LRRLastVersion";

@implementation AppDelegate (LRRGuide)

- (void)setUpRootViewControllver
{
    if ([LRRUserManager sharedUserManager].logined) {
        //首次存取角色
        LRRLog(@"角色:%@",[NSUserDefaults objectForKey:LRRUserType]);
        NSString *IdString = [NSUserDefaults objectForKey:LRRUserType];
        if ([IdString isEqualToString:@"WORKER"]) {
            LRRBaseTabBarController *rootVC = [[LRRBaseTabBarController alloc]init];
            self.window.rootViewController = rootVC;
        }else{
            LRRBasePublishTabBarController *rootVC = [[LRRBasePublishTabBarController alloc]init];
            self.window.rootViewController = rootVC;
        }

    }else{

        //定义一个窗口
        UIViewController *rootVC = [[UITabBarController alloc]init];
        self.window.rootViewController = rootVC;

        //获取当前的版本号
        NSString *curVersion = [NSBundle currentVersion];

        //获取上一次版本号
        NSString *oldVersion = [NSUserDefaults objectForKey:LRRLastVersionKey];

        if ([curVersion isEqualToString:oldVersion] == NO) {
            [NSUserDefaults setObject:curVersion forKey:LRRLastVersionKey];

            LRRChooseIDViewController *newFeatureVc = [[LRRChooseIDViewController alloc] initWithNibName:NSStringFromClass([LRRChooseIDViewController class]) bundle:[NSBundle mainBundle]];
            newFeatureVc.view.frame = [UIScreen mainScreen].bounds;
            [rootVC.view addSubview:newFeatureVc.view];
            [rootVC addChildViewController:newFeatureVc];
        }else{
            LRRChooseIDViewController *newFeatureVc = [[LRRChooseIDViewController alloc] initWithNibName:NSStringFromClass([LRRChooseIDViewController class]) bundle:[NSBundle mainBundle]];
            newFeatureVc.view.frame = [UIScreen mainScreen].bounds;
            [rootVC.view addSubview:newFeatureVc.view];
            [rootVC addChildViewController:newFeatureVc];
        }
    }
}



@end

