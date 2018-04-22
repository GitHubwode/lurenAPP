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
#import "LRRNationalViewCell.h"
#import "LRRAvatarViewCell.h"
#import "LRRWorkViewCell.h"
#import "LRRAgeViewCell.h"
#import "LRRTeamViewCell.h"
#import "LRRNameViewCell.h"
#import "LRREditUserRequestManager.h"
#import "LRREditMesssParam.h"
#import "TZImageManager.h"
#import <RongIMKit/RongIMKit.h>




@interface LRRMyEditViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
/**  */
@property (nonatomic, copy) NSString *type;
/** 昵称 */
@property (nonatomic, copy) NSString *nickname;
/** 头像地址 */
@property (nonatomic, copy) NSString *avatarUrl;
/** 电话号码 */
@property (nonatomic, copy) NSString *phone;
/** 性别 */
@property (nonatomic, copy) NSString *sex;
/** 真实姓名 */
@property (nonatomic, copy) NSString *name;
/** 民族 */
@property (nonatomic, copy) NSString *nation;
/** 身日 */
@property (nonatomic, copy) NSString *birthday;
/** 籍贯 */
@property (nonatomic, copy) NSString *hometown;
/** 团队人数 */
@property (nonatomic, copy) NSString *teamGroup;
/** 工种 */
@property (nonatomic, copy) NSString *workType;
/**工龄 */
@property (nonatomic, copy) NSString *workAge;
/** 穿件地址 */
@property (nonatomic, copy) NSString *currentAddress;

@end

@implementation LRRMyEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑信息";
    [self.view addSubview:self.tableView];
    [self addNavi];
    [self LRR_InitializeString];
}
#pragma mark - 初始化
- (void)LRR_InitializeString
{
    self.type = @"";
    self.nickname = @"";
    self.avatarUrl = @"";
    self.phone = @"";
    self.sex = @"";
    self.name = @"";
    self.nation = @"";
    self.birthday = @"";
    self.hometown = @"";
    self.teamGroup = @"";
    self.workType = @"";
    self.workAge = @"";
    self.currentAddress = @"";
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
    
    for (int i=1; i<self.dataArray.count; i++) {
        for (int j=0; j<[self.dataArray[i] count]; j++) {
            LRRLog(@"1111信息%@",self.dataArray[i][j]);
            LRRCustomInfoItem *item = self.dataArray[i][j];
            if ([item.title isEqualToString:@"姓名"]) {
                self.name = item.subtitle;
            }else if ([item.title isEqualToString:@"性别"]){
                self.sex = item.subtitle;
            }else if ([item.title isEqualToString:@"民族"]){
                self.nation = item.subtitle;
            }else if ([item.title isEqualToString:@"生日"]){
                self.birthday = item.subtitle;
            }else if ([item.title isEqualToString:@"籍贯"]){
                self.hometown = item.subtitle ;
            }else if ([item.title isEqualToString:@"工种"]){
                self.workType = item.subtitle;
            }else if ([item.title isEqualToString:@"工龄"]){
                self.workAge = item.subtitle;
            }else if ([item.title isEqualToString:@"团队规模"]){
                self.teamGroup = item.subtitle;
            }else if ([item.title isEqualToString:@"自我介绍"]){
                
            }else if ([item.title isEqualToString:@"团队介绍"]){
                
            }else if ([item.title isEqualToString:@"项目经验"]){
            }
        }
    }
    LRREditMesssParam *param = [[LRREditMesssParam alloc]initWithType:self.type Nickname:@"" AvatarUrl:self.avatarUrl Phone:self.phone Sex:self.sex Name:self.name Nation:self.nation Birthday:self.birthday Hometown:self.hometown TeamGroup:self.teamGroup WorkType:self.workType WorkAge:self.workAge];
    [LRREditUserRequestManager editUserMessageParam:param completion:^(LRRResponseObj *responseObj) {
        if (responseObj.code == LRRSuccessCode) {
            [self.view showHint:@"用户信息已更新"];
//            [self.navigationController popViewControllerAnimated:YES];
        }
        
    } aboveView:self.view inCaller:self];
    
    LRRLog(@"发布");
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

    if (indexPath.section == 0) {
        
        LRRAvatarViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRAvatarViewCell cellIdentifier]];
        cell.infoItem = item;
        return cell;
        
    }else if (indexPath.section == 1){
        if ([item.title isEqualToString:@"姓名"]) {
            LRRNameViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRNameViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        
        if ([item.title isEqualToString:@"性别"]) {
            LRRSexViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRSexViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        
        if ([item.title isEqualToString:@"民族"]) {
            LRRNationalViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRNationalViewCell cellIdentifier]];
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
        if ([item.title isEqualToString:@"工种"]) {
            LRRWorkViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRWorkViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        if ([item.title isEqualToString:@"工龄"]) {
            LRRAgeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRAgeViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        if ([item.title isEqualToString:@"团队规模"]) {
            LRRTeamViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRTeamViewCell cellIdentifier]];
            cell.infoItem = item;
            return cell;
        }
        
        
    }
    LRRIntroduceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRRIntroduceViewCell cellIdentifier]];
    cell.infoItem = item;
    return cell;
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
                [self selectPhoto:YES];
            }else if (1 == buttonIndex){
                [self takePhoto:YES];
            }
        } otherButtonTitles:@"拍照",@"从手机相册选择", nil];
        [sheet show];

        return;
    }

    id cell = [tableView cellForRowAtIndexPath:indexPath];

    [[cell textField] becomeFirstResponder];
}

- (void)selectPhoto:(BOOL)allowsEditing{
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (PHAuthorizationStatusAuthorized == status) {
                // 已获得权限
                self.imagePickerVc.allowsEditing = allowsEditing;
                self.imagePickerVc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:_imagePickerVc animated:YES completion:nil];
                
            }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
                alert.tag = 1;
                [alert show];
#define push @#clang diagnostic pop
            }
        });
    }];
}

- (void)takePhoto:(BOOL)allowsEditing{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied)) {
        // 无相机权限 做一个友好的提示
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        [alert show];
#define push @#clang diagnostic pop
        // 拍照之前还需要检查相册权限
    } else if ([[TZImageManager manager] authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.tag = 1;
        [alert show];
    } else if ([[TZImageManager manager] authorizationStatus] == 0) { // 正在弹框询问用户是否允许访问相册，监听权限状态
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            return [self takePhoto:allowsEditing];
        });
    } else { // 调用相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerVc.allowsEditing = allowsEditing;
            self.imagePickerVc.sourceType = sourceType;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:_imagePickerVc animated:YES completion:nil];
            });
        } else {
            LRRLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSData *data =UIImageJPEGRepresentation(info[UIImagePickerControllerEditedImage], 0.5f);
    NSString *encodedImageString = [data base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
    
    [LRREditUserRequestManager updataUserAvatarString:encodedImageString completion:^(LRRResponseObj *responseObj) {
        if (!responseObj) return ;
        if (responseObj.code == LRRSuccessCode) {
            LRRLog(@"%@",responseObj);
//            [self userMessage];
            [self changeUserMessage];
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    } aboveView:self.view inCaller:self];
}

#pragma mark - 更新用户的头像和昵称
- (void)changeUserMessage
{
    RCUserInfo *userInfo = [[RCUserInfo alloc]init];
    userInfo.name = [LRRUserManager sharedUserManager].currentUser.nickname;
    userInfo.userId = [LRRUserManager sharedUserManager].currentUser.userId;
    userInfo.portraitUri = [LRRUserManager sharedUserManager].currentUser.avatarUrl;
    [[RCIM sharedRCIM] refreshUserInfoCache:userInfo withUserId:userInfo.userId];
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
        
         [_tableView registerNib:[UINib nibWithNibName:@"LRRNameViewCell" bundle:nil] forCellReuseIdentifier:[LRRNameViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRAvatarViewCell" bundle:nil] forCellReuseIdentifier:[LRRAvatarViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRSexViewCell" bundle:nil] forCellReuseIdentifier:[LRRSexViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRBirthdayCell" bundle:nil] forCellReuseIdentifier:[LRRBirthdayCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRIntroduceViewCell" bundle:nil] forCellReuseIdentifier:[LRRIntroduceViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRCityViewCell" bundle:nil] forCellReuseIdentifier:[LRRCityViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRNationalViewCell" bundle:nil] forCellReuseIdentifier:[LRRNationalViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRWorkViewCell" bundle:nil] forCellReuseIdentifier:[LRRWorkViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRAgeViewCell" bundle:nil] forCellReuseIdentifier:[LRRAgeViewCell cellIdentifier]];
        
        [_tableView registerNib:[UINib nibWithNibName:@"LRRTeamViewCell" bundle:nil] forCellReuseIdentifier:[LRRTeamViewCell cellIdentifier]];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - 选择图片
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imagePickerVc.delegate = self;
        UIBarButtonItem *BarItem;
        if (([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)) {
            if (@available(iOS 9.0, *)) {
                BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
            } else {
                // Fallback on earlier versions
            }
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
#pragma clang diagnostic pop
        }
        UIImage *backImage = [UIImage imageNamed:@"nav_icon_back_photo_white"];
        [BarItem setBackButtonBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backImage.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    return _imagePickerVc;
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
