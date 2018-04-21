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
#import "LRRPublishOrderParam.h"
#import "LRRPublishOrderRequestManager.h"

@interface LRRPublishPointViewController ()<UITableViewDelegate,UITableViewDataSource,LRRPublishFooterDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) LRRPublishFooterView *footerView;
@property (nonatomic, strong) LRRLocationHelper *locationHelper;
/** 类型 */
@property (nonatomic, copy) NSString *workType;
/** 工种类型 */
@property (nonatomic,copy) NSString *type;
/** 用工人数 */
@property (nonatomic,assign) NSUInteger  number;
/** 用工天数 */
@property (nonatomic,assign) NSUInteger  days;
/** 用工单价 */
@property (nonatomic,assign) double  unitPrice;
/** 车费 */
@property (nonatomic,assign) double  fare;
/** 是否住工地 0否 1是 */
@property (nonatomic, assign) NSUInteger isSeting;

/** 项目地址 */
@property (nonatomic,copy) NSString *address;
/** 项目时长 */
@property (nonatomic,copy) NSString *whenLong;
/** 联系人名称 */
@property (nonatomic,copy) NSString *contacts;
/** 联系人电话 */
@property (nonatomic,copy) NSString *contactsPhone;
/** 备注 */
@property (nonatomic,copy) NSString *remark;
/** 工地简介 */
@property (nonatomic, copy) NSString *projectDesc;
/** 开始时间 */
@property (nonatomic,copy) NSString *workStartTime;
/** 工作结束时间 */
@property (nonatomic, copy) NSString *workEndTime;
/** 招工持续时间 */
@property (nonatomic, copy) NSString *workDevingTime;
/** 工程量 */
//@property (nonatomic, copy) NSString *workAmount;
/** 工资支付时间 */
@property (nonatomic,copy) NSString *lastPayTime;

@end

@implementation LRRPublishPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.workType = @"点工";
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = self.footerView;
}

#pragma mark - UITableViewDelegate  UITableViewDatasource

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
        if ([item.title isEqualToString:@"联系人:"]) {
            item.subtitle = [LRRUserManager sharedUserManager].currentUser.nickname;
        }else if ([item.title isEqualToString:@"联系电话:"]){
            item.subtitle = [LRRUserManager sharedUserManager].currentUser.phone;
        }
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
    for (int i =0; i < self.datasource.count; i++) {
        for (LRRCustomInfoItem *item in self.datasource[i]) {
            LRRLog(@"信息%@",item.subtitle);
            if (![item.title isEqualToString:@"工地简介"]) {
                if (item.subtitle == nil || [item.subtitle isEqualToString:@""]) {
                    NSString *message = [NSString stringWithFormat:@"%@信息不能为空",item.title];
                    [self.view showHint:message];
                    return;
                }
            }
            
            if ([item.title isEqualToString:@"工种:"]) {
                self.type = item.subtitle;
            }else if ([item.title isEqualToString:@"人数:"]){
                self.number = [item.subtitle integerValue];
            }else if ([item.title isEqualToString:@"工资:"]){
                self.unitPrice = [item.subtitle doubleValue];
            }else if ([item.title isEqualToString:@"车费:"]){
                self.fare = [item.subtitle doubleValue];
            }else if ([item.title isEqualToString:@"是否住工地:"]){
                self.isSeting = [item.subtitle isEqualToString:@"住"] ? 1 : 0 ;
            }else if ([item.title isEqualToString:@"开工时间:"]){
                self.workStartTime = [NSString PublishWorkTimeStamp:item.subtitle];
            }else if ([item.title isEqualToString:@"结束时间:"]){
                self.workEndTime = [NSString PublishWorkTimeStamp:item.subtitle];
            }else if ([item.title isEqualToString:@"备注信息:"]){
                self.remark = item.subtitle;
            }else if ([item.title isEqualToString:@"工程简介:"]){
                self.projectDesc = item.subtitle;
            }else if ([item.title isEqualToString:@"联系人:"]){
                self.contacts = item.subtitle;
            }else if ([item.title isEqualToString:@"联系电话:"]){
                self.contactsPhone = item.subtitle;
            }else if ([item.title isEqualToString:@"工程地址:"]){
                self.address = item.subtitle;
            }else if ([item.title isEqualToString:@"招工持续时间:"]){
                self.workDevingTime = [NSString PublishWorkTimeStamp:item.subtitle];
            }else if ([item.title isEqualToString:@"工资结算时间:"]){
                self.lastPayTime = [NSString PublishWorkTimeStamp:item.subtitle];
            }
        }
    }
    
    
    
    NSUInteger userId = [[LRRUserManager sharedUserManager].currentUser.userId integerValue];
    NSString *avatarURL = [LRRUserManager sharedUserManager].currentUser.avatarUrl;

    LRRPublishOrderParam *param = [[LRRPublishOrderParam alloc]initWithUserId:userId Name:self.contacts Type:self.type WorkType:self.workType Number:self.number Days:self.days UnitPrice:self.unitPrice Fare:self.fare IsSeting:self.isSeting ProjectDesc:self.projectDesc WorkEndTime:self.workEndTime WorkDevingTime:self.workDevingTime WorkAmount:@"" Remark:self.remark WorkStartTime:self.workStartTime LastPayTime:self.lastPayTime Longitude:0 Latitude:0 Address:self.address AvatarUrl:avatarURL WhenLong:nil Contacts:self.contacts ContactsPhone:self.contactsPhone];
    
    [LRRPublishOrderRequestManager publishCreatOrderParam:param completion:^(LRRResponseObj *responseObj) {
        if (responseObj.code == LRRSuccessCode) {
            [self.view showHint:@"发布成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }

    } aboveView:self.view inCaller:self];
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

- (LRRLocationHelper *)locationHelper{
    if (!_locationHelper) {
        _locationHelper = [[LRRLocationHelper alloc] init];
    }
    return _locationHelper;
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
