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

@interface LRRPointWorkViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation LRRPointWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRLookTableViewCell lookIdentifier] forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"点击");
    LRROrderDetailViewController *orderVC = [[LRROrderDetailViewController alloc]init];
    [self.navigationController pushViewController:orderVC animated:YES];
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNaviHeight, kMainScreenWidth, kMainScreenHeight-2*kNaviHeight+24) style:UITableViewStylePlain];
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
