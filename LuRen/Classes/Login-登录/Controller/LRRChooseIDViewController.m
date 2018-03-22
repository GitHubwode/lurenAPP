//
//  LRRChooseIDViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRChooseIDViewController.h"
#import "LRRBaseTabBarController.h"
#import "LRRBasePublishTabBarController.h"

@interface LRRChooseIDViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation LRRChooseIDViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)chooseWorkerButtonClick:(UIButton *)sender {

    [self jumpLoginViewIdentity:@"WORKER"];
}
- (IBAction)chooseBossButtonClick:(UIButton *)sender {

    [self jumpLoginViewIdentity:@"BOSS"];

}

- (void)jumpLoginViewIdentity:(NSString *)IdString
{
    [NSUserDefaults removeObjectForKey:LRRUserType];
    //首次存取角色
    [NSUserDefaults setObject:IdString forKey:LRRUserType];
    LRRLog(@"角色:%@",[NSUserDefaults objectForKey:LRRUserType]);
    
    if ([IdString isEqualToString:@"WORKER"]) {
        LRRBaseTabBarController *rootVC = [[LRRBaseTabBarController alloc]init];
        self.view.window.rootViewController = rootVC;
    }else{
        LRRBasePublishTabBarController *rootVC = [[LRRBasePublishTabBarController alloc]init];
        self.view.window.rootViewController = rootVC;
    }
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}



- (IBAction)cancelButtonClick:(UIButton *)sender {
    [self jumpLoginViewIdentity:@"WORKER"];
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
