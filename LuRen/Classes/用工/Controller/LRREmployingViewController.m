//
//  LRREmployingViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/9.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRREmployingViewController.h"
#import "LRRPublishedWorkViewController.h"
#import "WMTabControl.h"
#import "WMDropDownView.h"
#import "LRREmployingViewCell.h"
#import "LRRUserDetailedViewController.h"
#import "LRRPublishOrderRequestManager.h"
#import "LRRUserMessageModel.h"

@interface LRREmployingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) WMTabControl *tabControl;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, assign) NSUInteger pageNum;
@end

@implementation LRREmployingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.titleType isEqualToString:@"BOSS"] || [self.titleType isEqualToString:@"WORKER"]) {
        self.navigationItem.title = @"用户信息";
    }else{
       self.navigationItem.title = @"用工";
        self.titleType = @"WORKER";
        [self addNavi];
    }

    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [LRRRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(orderListRefreshRequest)];
    self.tableView.mj_footer = [LRRRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(orderListLoadRequest)];
    [self.tableView.mj_header beginRefreshing];
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
    [LRRPublishOrderRequestManager publishLookWorkerPageNum:self.pageNum Rows:10 Type:self.titleType completion:^(NSArray<LRRUserMessageModel *> *responseObj) {
        
        if (!responseObj) {
            if (refresh) {
                [self.tableView.mj_header endRefreshing];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
        }else{ //有数据
            self.pageNum ++;
            if (refresh) {
                [self.tableView.mj_header endRefreshing];
                [self.datasource removeAllObjects];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
            [self.datasource addObjectsFromArray:responseObj];
        }
        [self.tableView reloadData];
        
    } aboveView:self.view inCaller:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    view.backgroundColor = LRRViewBackgroundColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRUserMessageModel *model = self.datasource[indexPath.row];
    LRREmployingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRREmployingViewCell employIdentifier] forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"点击");
     LRRUserMessageModel *model = self.datasource[indexPath.row];
    LRRUserDetailedViewController *detailsVC = [[LRRUserDetailedViewController alloc]init];
    detailsVC.userMessageModel = model;
    detailsVC.isUser = 2;
    [self.navigationController pushViewController:detailsVC animated:YES];
}




#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithButtonTitle:@"发布" target:self action:@selector(PublishedWork)];
}

#pragma mark - 保存编辑的信息
- (void)PublishedWork
{
    LRRLog(@"发布");
    LRRPublishedWorkViewController *publishVC = [[LRRPublishedWorkViewController alloc]init];
    [self.navigationController pushViewController:publishVC animated:YES];
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, LRRDropDownHeight, kMainScreenWidth, kMainScreenHeight-kNaviHeight-LRRDropDownHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRREmployingViewCell" bundle:nil] forCellReuseIdentifier:[LRREmployingViewCell employIdentifier]];
        _tableView.rowHeight = 67.f;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)datasource
{
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
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
