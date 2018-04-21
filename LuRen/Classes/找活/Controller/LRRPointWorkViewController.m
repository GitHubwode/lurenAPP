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
#import "WMTabControl.h"
#import "WMDropDownView.h"
#import "LRRReceiveOrderRequestManager.h"

@interface LRRPointWorkViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_one;
    NSMutableArray *_two;
    NSMutableArray *_three;
    NSArray *_total;
    NSMutableArray *_totalIndex;
    
    NSInteger _segIndex;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, assign) NSUInteger pageNum;
@property (nonatomic, strong) WMTabControl *tabControl;


@end

@implementation LRRPointWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabControl = [[WMTabControl alloc]initWithFrame:CGRectMake(0, 1, kMainScreenWidth, LRRDropDownHeight)];
    self.tabControl.backgroundColor = UIColorHex(0xffffff);
    [self.view addSubview:self.tabControl];
    // 1.设置数据和初始索引
    _one = [NSMutableArray arrayWithObjects:@"全部", @"杭州", @"金华", @"临平", @"湖州", nil];
    _two = [NSMutableArray arrayWithObjects:@"全部工种", @"木工", @"钢筋工", @"外架子工", @"内架子工", nil];
    _three = [NSMutableArray arrayWithObjects:@"类型", @"土木建筑", @"装修建筑", nil];
    _total = @[_one, _two, _three];
    _totalIndex = [NSMutableArray arrayWithObjects:@0, @0, @0, nil];
    __weak typeof(self) weakSelf = self;
    [_tabControl setItemsWithTitleArray:@[_one[0], _two[0], _three[0]]
                          selectedBlock:^(NSInteger index) {
                              [weakSelf openList:index];
                          }];
    
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
    [self.navigationController pushViewController:orderVC animated:YES];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    // 2.下拉菜单的转屏适配，如不转屏则不用这部分
    WMDropDownView *listView = (WMDropDownView *)[self.view viewWithTag:9898];
    if (listView) {
        CGFloat y = CGRectGetMaxY(_tabControl.frame);
        listView.frame = CGRectMake(0, y, CGRectGetWidth(_tabControl.frame), CGRectGetHeight(self.view.frame) - y - 49);
    }
}

- (void)openList:(NSInteger)column
{
    // 3.下拉菜单的处理
    WMDropDownView *listView = (WMDropDownView *)[self.view viewWithTag:9898];
    if (!listView) {
        // 3.1 显示下拉菜单
        _segIndex = column;
        NSArray *lists = (NSArray *)_total[column];
        
        CGFloat y = CGRectGetMaxY(_tabControl.frame);
        CGRect rect = CGRectMake(0, y, CGRectGetWidth(_tabControl.frame), CGRectGetHeight(self.view.frame) - y - 49);
        
        __weak typeof(self) weakSelf = self;
        WMDropDownView *listView =
        [[WMDropDownView alloc] initWithFrame:rect
                                       titles:lists
                                 defaultIndex:[_totalIndex[column] integerValue]
                                selectedBlock:^(id title, NSInteger index) {
                                    [weakSelf changeIndex:index withColumn:column];
                                }];
        listView.tag = 9898;
        [self.view addSubview:listView];
        [listView showView];
    } else if (_segIndex != column) {
        // 3.2 已存在下拉菜单，切换展示内容
        _segIndex = column;
        NSArray *lists = (NSArray *)_total[column];
        __weak typeof(self) weakSelf = self;
        [listView changeWithTitles:lists
                      defaultIndex:[_totalIndex[column] integerValue]
                     selectedBlock:^(id title, NSInteger index) {
                         [weakSelf changeIndex:index withColumn:column];
                     }];
    } else {
        // 3.3 隐藏下拉菜单
        [listView hideView];
    }
}

- (void)changeIndex:(NSInteger)index withColumn:(NSInteger)column
{
    // 4. 用户点击了下拉菜单
    if (index == -1) {
        // 4.1 恢复分段条状态
        [_tabControl selectIndex:-1];
        return;
    }
    // 4.2 改变对应的记录索引
    [_totalIndex replaceObjectAtIndex:column withObject:[NSNumber numberWithInteger:index]];
    
    // 4.3 改变分段条的对应项标题，如果不想改变则不执行这条
    [_tabControl setTitle:_total[column][index] withIndex:column];
    LRRLog(@"内容:%@",_total[column][index]);
    LRRLog(@"区:%ld",(long)column);
    LRRLog(@"列表:%ld",(long)index);
    // 4.4 按选择改变内容排序
    [self changeOrder];
}

- (void)changeOrder
{
    LRRLog(@"选择什么");
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
