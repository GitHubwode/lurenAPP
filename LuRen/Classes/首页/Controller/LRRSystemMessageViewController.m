//
//  LRRSystemMessageViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/14.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSystemMessageViewController.h"
#import "LRRSystemMessageViewCell.h"
#import "LRRHomeReportViewController.h"

@interface LRRSystemMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, assign) NSUInteger pageNum;

@end

@implementation LRRSystemMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"系统消息";
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [LRRRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(orderListRefreshRequest)];
    self.tableView.mj_footer = [LRRRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(orderListLoadRequest)];
//    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - 获取数据
- (void)orderListRefreshRequest
{
    self.pageNum = 1;
    [self orderListRequest:YES];
}

- (void)orderListLoadRequest
{
    [self orderListRequest:NO];
}

- (void)orderListRequest:(BOOL)refresh
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRSystemMessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRSystemMessageViewCell systemIdentifier] forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"点击");
    LRRHomeReportViewController *reportVC = [[LRRHomeReportViewController alloc]init];
    [self.navigationController pushViewController:reportVC animated:YES];
   
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-kNaviHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRSystemMessageViewCell" bundle:nil] forCellReuseIdentifier:[LRRSystemMessageViewCell systemIdentifier]];
        _tableView.rowHeight = 143.f;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
