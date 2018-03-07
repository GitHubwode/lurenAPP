//
//  LRRServiceCenterViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRServiceCenterViewController.h"
#import "LRRServiceCenterHeaderView.h"
#import "LRRLRRServiceCenterHeaderCell.h"
#import "LRRServiceCenterModel.h"
@interface LRRServiceCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) LRRServiceCenterHeaderView *headerView;

@end

@implementation LRRServiceCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客服中心";
    self.tableView.tableHeaderView = self.headerView;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegage UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRServiceCenterModel*item = self.datasource[indexPath.row];
    LRRLRRServiceCenterHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRLRRServiceCenterHeaderCell serviceCenterIdentifier] forIndexPath:indexPath];
    cell.centerModel = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"点击单元格");
}

#pragma mark - 懒加载

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 396) style:UITableViewStyleGrouped];
        _tableView.rowHeight = 44.f;
        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRLRRServiceCenterHeaderCell" bundle:nil] forCellReuseIdentifier:[LRRLRRServiceCenterHeaderCell serviceCenterIdentifier]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (LRRServiceCenterHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LRRServiceCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 220)];
    }
    return _headerView;
}

- (NSMutableArray *)datasource
{
    if (!_datasource) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"ServiceCenter" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _datasource = [LRRServiceCenterModel mj_objectArrayWithKeyValuesArray:array.lastObject];
    }
    return _datasource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    LRRLogFunc
}

@end
