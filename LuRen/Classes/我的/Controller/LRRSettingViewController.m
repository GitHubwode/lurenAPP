//
//  LRRSettingViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/18.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSettingViewController.h"
#import "LRRSettingViewCell.h"
#import "LRRMeMessageModel.h"


@interface LRRSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) UIButton *exitButton;

@end

@implementation LRRSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self.view addSubview:self.tableView];
    [self settingAddExitButton];
}

- (void)settingAddExitButton
{
    [self.view addSubview:self.exitButton];
    weakSelf(self);
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.view.mas_centerX);
        make.bottom.equalTo(weakself.view.mas_bottom).offset(-20);
        make.height.equalTo(@(45.f));
        make.width.equalTo(@(LRRAdaptedWidth(247.f)));
    }];
}

- (void)loginOutButton:(UIButton *)sender
{
    LRRLog(@"退出登录");
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
    return 44.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc]init];
    //    footView.backgroundColor = LRRViewBackgroundColor;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = LRRViewBackgroundColor;
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRMeMessageModel*item = self.datasource[indexPath.section][indexPath.row];
    LRRSettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRSettingViewCell settingIdenfier] forIndexPath:indexPath];
    cell.nameLabel.text = item.titleString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRMeMessageModel*item = self.datasource[indexPath.section][indexPath.row];
    Class class = NSClassFromString(item.linkVC);
    [self.navigationController pushViewController:[class new] animated:YES];
}

- (void)dealloc
{
    LRRLogFunc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRSettingViewCell" bundle:nil] forCellReuseIdentifier:[LRRSettingViewCell settingIdenfier]];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)datasource
{
    if (!_datasource) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"SettingList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _datasource = [LRRMeMessageModel mj_objectArrayWithKeyValuesArray:array.lastObject];
    }
    return _datasource;
}

- (UIButton *)exitButton
{
    if (!_exitButton) {
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitButton setTitleColor:UIColorHex(0xffffff) forState:UIControlStateNormal];
        [_exitButton setTitle:@"退出登录" forState:UIControlStateNormal];
        _exitButton.titleLabel.font = LRRFont(15);
        [_exitButton setBackgroundImage:[UIImage imageNamed:@"exitButtonBg"] forState:UIControlStateNormal];
        [_exitButton addTarget:self action:@selector(loginOutButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitButton;
}

@end
