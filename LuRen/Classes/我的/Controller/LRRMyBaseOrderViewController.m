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
