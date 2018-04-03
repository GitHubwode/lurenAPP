//
//  LRRHomeReportViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/14.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeReportViewController.h"
#import "LRRHomeReportViewCell.h"

@interface LRRHomeReportViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, assign) NSUInteger pageNum;

@end

@implementation LRRHomeReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"居工快报";
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
    LRRHomeReportViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRHomeReportViewCell reportIdentifier] forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"点击");
    
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
        [_tableView registerNib:[UINib nibWithNibName:@"LRRHomeReportViewCell" bundle:nil] forCellReuseIdentifier:[LRRHomeReportViewCell reportIdentifier]];
        _tableView.rowHeight = 120.f;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
