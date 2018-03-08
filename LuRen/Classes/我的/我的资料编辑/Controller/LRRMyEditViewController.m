//
//  LRRMyEditViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRMyEditViewController.h"
#import "LRRCustomInfoItem.h"
#import "LCActionSheet.h"
#import "LRRSexViewCell.h"
#import "LRRBirthdayCell.h"
#import "LRRIntroduceViewCell.h"
#import "LRRCityViewCell.h"


@interface LRRMyEditViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LRRMyEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑信息";
    [self.view addSubview:self.tableView];
    [self addNavi];
}

#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithButtonTitle:@"保存" target:self action:@selector(saveUserEdit)];
}

#pragma mark - 保存编辑的信息
- (void)saveUserEdit
{
    LRRLog(@"保存编辑好的信息");
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 56.f;
    }else if (indexPath.section == 3){
        return 109.f;
    }else{
        return 44.f;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LRRCustomInfoItem *item = self.dataArray[indexPath.section][indexPath.row];
    
//    if (indexPath.section == 3) {
//        LRRIntroduceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRIntroduceViewCell cellIdentifier]];
//        cell.infoItem = item;
//        return cell;
//    }else{
//        LRRSexViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRSexViewCell cellIdentifier]];
//        cell.infoItem = item;
//        return cell;
//    }
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        if ([item.title isEqualToString:@"性别"]) {
            LRRSexViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRSexViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        
        if ([item.title isEqualToString:@"生日"]) {
            LRRBirthdayCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRBirthdayCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        
        if ([item.title isEqualToString:@"籍贯"]) {
            LRRCityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRCityViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        
    }else if (indexPath.section == 2){
        
    }
    LRRIntroduceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRIntroduceViewCell cellIdentifier]];
    cell.infoItem = item;
    return cell;
    
    
   
    

    
    

//    if ([item.title isEqualToString:@"头像"]) { // 头像
//        SNHAvatarInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[SNHAvatarInfoCell cellIdentifier]];
//        cell.infoItem = item;
//        return cell;
//    }
    
//    if ([item.title isEqualToString:@"所在城市"]) {
//        SNHCityCell *cell = [tableView dequeueReusableCellWithIdentifier:[SNHCityCell cellIdentifier]];
//        if(!cell.delegate) cell.delegate = self;
//        cell.infoItem = item;
//        return cell;
//    }
    
//    if ([item.title isEqualToString:@"生日"]) {
//        SNHBirthdayCell *cell = [tableView dequeueReusableCellWithIdentifier:[SNHBirthdayCell cellIdentifier]];
//        if(!cell.delegate) cell.delegate = self;
//        cell.infoItem = item;
//        return cell;
//    }
    
//    if ([item.title isEqualToString:@"个人简介"]) {
//        SNHlongTextCell *cell = [tableView dequeueReusableCellWithIdentifier:[SNHlongTextCell cellIdentifier]];
//        cell.infoItem = item;
//        return cell;
//    }
    
//    if ([item.title isEqualToString:@"生活照"]) {
//        SNHLifePhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:[SNHLifePhotoCell cellIdentifier]];
//        if(!cell.delegate) cell.delegate = self;
//        cell.infoItem = item;
//        return cell;
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    LRRCustomInfoItem *item = self.dataArray[indexPath.section][indexPath.row];
    LRRLog(@"%@",item);
    LRRLog(@"%ld",(long)indexPath.row);
    LRRLog(@"%@",[self.dataArray[0] class]);
    if (!item.enabled) return;

    if ([item.title isEqualToString:@"头像"]){

        LCActionSheet *sheet = [LCActionSheet sheetWithTitle:nil cancelButtonTitle:@"取消" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {

            if (2 == buttonIndex) {
//                [self selectPhoto:YES];
            }else if (1 == buttonIndex){
//                [self takePhoto:YES];
            }
        } otherButtonTitles:@"拍照",@"从手机相册选择", nil];
        [sheet show];

        return;
    }

    id cell = [tableView cellForRowAtIndexPath:indexPath];

    [[cell textField] becomeFirstResponder];
}

#pragma mark - 懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [LRRCustomInfoItem mj_objectArrayWithFilename:@"LRREditMessageList.plist"];    }
    return _dataArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-kNaviHeight) style:UITableViewStyleGrouped];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.backgroundColor = LRRViewBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LRRSexViewCell" bundle:nil] forCellReuseIdentifier:[LRRSexViewCell cellIdentifier]];
        [_tableView registerNib:[UINib nibWithNibName:@"LRRBirthdayCell" bundle:nil] forCellReuseIdentifier:[LRRBirthdayCell cellIdentifier]];
        [_tableView registerNib:[UINib nibWithNibName:@"LRRIntroduceViewCell" bundle:nil] forCellReuseIdentifier:[LRRIntroduceViewCell cellIdentifier]];
        [_tableView registerNib:[UINib nibWithNibName:@"LRRCityViewCell" bundle:nil] forCellReuseIdentifier:[LRRCityViewCell cellIdentifier]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
