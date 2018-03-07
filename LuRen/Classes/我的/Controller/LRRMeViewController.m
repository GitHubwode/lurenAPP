//
//  LRRMeViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRMeViewController.h"
#import "LRRMeHeaderView.h"
#import "LRRMeMessageModel.h"
#import "LRRMeTableViewCell.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "LRRUserDetailedViewController.h"

@interface LRRMeViewController ()<UITableViewDataSource,UITableViewDelegate,LRRHeaderViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) LRRMeHeaderView *headerView;

@end

#define kTabbarHeight ([UIScreen mainScreen].bounds.size.height == 812 ? 44 : 20)
#define kHeaderHeight ([UIScreen mainScreen].bounds.size.height == 812 ? 188 : 164)

@implementation LRRMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.tableView.tableHeaderView = self.headerView;
    [self.view addSubview:self.tableView];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return  UIStatusBarStyleLightContent;
}

- (void)headerViewTapMessage
{
    LRRLog(@"跳转用户信息");
    LRRUserDetailedViewController *userVC = [[LRRUserDetailedViewController alloc]init];
    [self.navigationController pushViewController:userVC animated:YES];
}

#pragma mark - UITableViewDelegage UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datasource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datasource[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 53.f;
    }else{
        return 44.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor = LRRViewBackgroundColor;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRMeMessageModel*item = self.datasource[indexPath.section][indexPath.row];
    LRRMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRMeTableViewCell meTableCellIdentifier] forIndexPath:indexPath];
    cell.item = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRMeMessageModel*item = self.datasource[indexPath.section][indexPath.row];
    Class class = NSClassFromString(item.linkVC);
    [self.navigationController pushViewController:[class new] animated:YES];
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -kTabbarHeight, kMainScreenWidth, kMainScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRMeTableViewCell" bundle:nil] forCellReuseIdentifier:[LRRMeTableViewCell meTableCellIdentifier]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)datasource
{
    if (!_datasource) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"MeMessageList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _datasource = [LRRMeMessageModel mj_objectArrayWithKeyValuesArray:array.lastObject];
    }
    return _datasource;
}

- (LRRMeHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LRRMeHeaderView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kHeaderHeight)];
        _headerView.delegate = self;
    }
    return _headerView;
}

- (void)dealloc
{
    LRRLogFunc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
