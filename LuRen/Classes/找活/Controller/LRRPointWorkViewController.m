//
//  LRRPointWorkViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/22.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPointWorkViewController.h"
#import "LRRLookTableViewCell.h"
#import "LRROrderDetailViewController.h"
#import "LRRReceiveOrderRequestManager.h"

@interface LRRPointWorkViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, assign) NSUInteger pageNum;


@end

@implementation LRRPointWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"找活";
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
    [LRRReceiveOrderRequestManager searchOrderListType:LRRReceiveALLOrderRequestType Page:self.pageNum Longitude:0 Latitude:0 completion:^(NSArray<LRROrderDetailsModel *> *response) {
        if (!response) {
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
            [self.datasource addObjectsFromArray:response];
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
    return 10.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRROrderDetailsModel *model = self.datasource[indexPath.row];
    LRRLookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRLookTableViewCell lookIdentifier] forIndexPath:indexPath];
    cell.orderModel = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"点击");
    LRROrderDetailViewController *orderVC = [[LRROrderDetailViewController alloc]init];
    orderVC.orderModel = self.datasource[indexPath.row];
    orderVC.blockOrder = ^{
        [self.datasource removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:orderVC animated:YES];
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, LRRDropDownHeight, kMainScreenWidth, kMainScreenHeight-kNaviHeight-LRRDropDownHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRLookTableViewCell" bundle:nil] forCellReuseIdentifier:[LRRLookTableViewCell lookIdentifier]];
        _tableView.rowHeight = 130.f;
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
