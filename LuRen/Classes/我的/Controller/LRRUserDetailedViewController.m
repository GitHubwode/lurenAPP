//
//  LRRUserDetailedViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRUserDetailedViewController.h"
#import "LRRUserDetailedView.h"
#import "LRRUserDetailedViewCell.h"
#import "LRRFeedbackViewController.h"
#import "LRRMyEditViewController.h"

@interface LRRUserDetailedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LRRUserDetailedView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation LRRUserDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详细信息";
    
    LRRLog(@"%@%lu",self.userMessageModel,(unsigned long)self.isUser);
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.userMessageModel = self.userMessageModel;
    self.headerView.isUser = self.isUser;
    if (self.isUser == 1) {
       [self.headerView lrr_ChangeuUpdateUserMessage];
    }
    
    [self.view addSubview:self.tableView];
    //创建导航栏按钮
    [self addNavi];
}

#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:self.navTitle target:self action:@selector(messageAction)];
}

#pragma mark - 点击事件
- (void)messageAction
{
    LRRLog(@"举报");
    
    if ([self.navTitle isEqualToString:@"举报"]) {
//        LRRFeedbackViewController *feedVC = [[LRRFeedbackViewController alloc]init];
//        feedVC.titleString = self.navTitle;
//        [self.navigationController pushViewController:feedVC animated:YES];
    }else{
        weakSelf(self);
        LRRMyEditViewController *editVC = [[LRRMyEditViewController alloc]init];
        editVC.backBlock = ^{
            [self.headerView lrr_ChangeuUpdateUserMessage];
            [self.tableView reloadData];
            [weakself changeUserMessage];
        };
        [self.navigationController pushViewController:editVC animated:YES];
    }
}

#pragma mark - 回调我的页面
- (void)changeUserMessage
{
    if (self.changeBackLock) {
        self.changeBackLock();
    }
}

#pragma mark - UITableViewDelegage UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRUserDetailedViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRUserDetailedViewCell userDetailedIdentifier] forIndexPath:indexPath];
//    [cell changeUserMessage];
    return cell;
}

#pragma mark - 懒加载

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-kNaviHeight) style:UITableViewStyleGrouped];
        _tableView.rowHeight = 142.f;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRUserDetailedViewCell" bundle:nil] forCellReuseIdentifier:[LRRUserDetailedViewCell userDetailedIdentifier]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (LRRUserDetailedView *)headerView
{
    if (!_headerView) {
        _headerView = [[LRRUserDetailedView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 241)];
       
    }
    return _headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LRRUserMessageModel *)userMessageModel
{
    if (!_userMessageModel) {
        _userMessageModel = [[LRRUserMessageModel alloc]init];
    }
    return _userMessageModel;
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
