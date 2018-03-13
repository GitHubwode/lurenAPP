//
//  LRRPublishPointViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishPointViewController.h"
#import "LRRCustomInfoItem.h"
#import "LRRPublishFooterView.h"
#import "LRRPublishWorkViewCell.h"
#import "LRRPublishTimeViewCell.h"
#import "LRRPublishTeamViewCell.h"
#import "LRRPublishWriteViewCell.h"
#import "LRRPublishLiveViewCell.h"
#import "LRRPublishMarkViewCell.h"
#import "LRRPublishintroductionViewCell.h"

@interface LRRPublishPointViewController ()<UITableViewDelegate,UITableViewDataSource,LRRPublishFooterDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) LRRPublishFooterView *footerView;

@end

@implementation LRRPublishPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = self.footerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datasource.count;
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 || indexPath.section ==3 ) {
        return 168.f;
    }else{
        return 44.f;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.datasource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRRCustomInfoItem *item = self.datasource[indexPath.section][indexPath.row];
    if (indexPath.section == 0) {
        if ([item.title isEqualToString:@"工种:"]) {
            LRRPublishWorkViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishWorkViewCell cellIdentifier] forIndexPath:indexPath];
            cell.infoItem = item;
            return cell;
        }else if ([item.title isEqualToString:@"人数:"]){
            LRRPublishTeamViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishTeamViewCell cellIdentifier] forIndexPath:indexPath];
            cell.infoItem = item;
            return cell;
        }else{
            LRRPublishWriteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishWriteViewCell cellIdentifier] forIndexPath:indexPath];
            cell.infoItem = item;
            return cell;
        }
        
    }else if (indexPath.section == 1){
        if ([item.title isEqualToString:@"是否住工地:"]) {
            LRRPublishLiveViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishLiveViewCell cellIdentifier] forIndexPath:indexPath];
            cell.infoItem = item;
            return cell;
        }else{
            LRRPublishTimeViewCell*cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishTimeViewCell cellIdentifier] forIndexPath:indexPath];
            cell.infoItem = item;
            return cell;
        }
    }else if (indexPath.section == 2){
        
        LRRPublishMarkViewCell*cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishMarkViewCell cellIdentifier] forIndexPath:indexPath];
        cell.infoItem = item;
        return cell;
        
    }else if (indexPath.section == 3){
        LRRPublishintroductionViewCell*cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishintroductionViewCell cellIdentifier] forIndexPath:indexPath];
        cell.infoItem = item;
        return cell;
        
    }else if (indexPath.section == 4){
        LRRPublishWriteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishWriteViewCell cellIdentifier] forIndexPath:indexPath];
        cell.infoItem = item;
        return cell;
    }
        LRRPublishTimeViewCell*cell = [tableView dequeueReusableCellWithIdentifier:[LRRPublishTimeViewCell cellIdentifier] forIndexPath:indexPath];
        cell.infoItem = item;
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LRRCustomInfoItem *item = self.datasource[indexPath.section][indexPath.row];
    LRRLog(@"%@",item);
    LRRLog(@"%ld",(long)indexPath.row);
    if (!item.enabled) return;
    
    id cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [[cell textField] becomeFirstResponder];
}

#pragma mark -LRRPublishFooterDelegate
- (void)ensurePublshButtonClicked
{
    LRRLog(@"发布");
}


#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-kNaviHeight-54) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishWorkViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishWorkViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishTeamViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishTeamViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishWriteViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishWriteViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishTimeViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishTimeViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishLiveViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishLiveViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishMarkViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishMarkViewCell cellIdentifier]];
         [_tableView registerNib:[UINib nibWithNibName:@"LRRPublishintroductionViewCell" bundle:nil] forCellReuseIdentifier:[LRRPublishintroductionViewCell cellIdentifier]];
        
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)datasource
{
    if (!_datasource) {
        _datasource = [LRRCustomInfoItem mj_objectArrayWithFilename:@"LRRPublishPointList.plist"];    }
    return _datasource;
}

- (LRRPublishFooterView *)footerView
{
    if (!_footerView) {
        _footerView = [[LRRPublishFooterView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 179)];
        _footerView.footerDelegate = self;
    }
    return _footerView;
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
