//
//  LRROrderDetailViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/23.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRROrderDetailViewController.h"
#import "LRROrderDetailTableViewCell.h"
#import "LRRFeedbackViewController.h"

@interface LRROrderDetailViewController ()<UITableViewDataSource,UITableViewDelegate,LRROrderDetailTableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@end

@implementation LRROrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    [self.view addSubview:self.tableView];
    [self addNavi];
}

#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"举报" target:self action:@selector(messageAction)];
}

#pragma mark - 点击事件
- (void)messageAction
{
    LRRFeedbackViewController *feedVC = [[LRRFeedbackViewController alloc]init];
    feedVC.titleString = @"举报";
    [self.navigationController pushViewController:feedVC animated:YES];
}

#pragma mark -LRROrderDetailTableViewCellDelegate
- (void)moreChargeStandardButtonClick:(UIButton *)sender
{
    LRRLog(@"更多收费标准");
}

- (void)orderDetailButtonClick:(UIButton *)sender
{
    LRRLog(@"接单按钮");
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = LRRViewBackgroundColor;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRROrderDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRROrderDetailTableViewCell orderDetailIdentifier] forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}


#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-kNaviHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRROrderDetailTableViewCell" bundle:nil] forCellReuseIdentifier:[LRROrderDetailTableViewCell orderDetailIdentifier]];
        _tableView.rowHeight = 740.f;
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
