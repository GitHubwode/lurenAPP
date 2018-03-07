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

static NSString * const LRRLastVersionKey = @"LRRLastVersion";

@implementation AppDelegate (LRRGuide)

- (void)setUpRootViewControllver
{
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



@end

