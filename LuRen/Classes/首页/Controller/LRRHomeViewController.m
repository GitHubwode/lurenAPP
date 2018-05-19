///
//  LRRHomeViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRHomeViewController.h"
#import "LRRHomeHeaderView.h"
#import "LRRHomeCollectionViewCell.h"
#import "LRRHomeCollectionReusableView.h"
#import "LRRUserDetailedViewController.h"
#import "LRRSystemMessageViewController.h"
#import "LRRHomeRequestManager.h"
#import "LRRPublishOrderRequestManager.h"
#import "LRRUserMessageModel.h"
#import "LRREmployingViewController.h"
#import "LRRWebViewController.h"
#import "LRRSlideShowModel.h"

//测试
#import "LRRLoginViewController.h"

static CGFloat headerHeight = 232.f;

@interface LRRHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LRRHomeCollectionReusableViewDelegate,LRRHomeFirstCollectionReusableViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) LRRHomeHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) NSMutableArray *bossArray;
@property (nonatomic, strong) NSMutableArray *workerArray;
@property (nonatomic, strong) LRRLocationHelper *locationHelper;
@property (nonatomic, strong) NSMutableArray *imageArray;


@end

@implementation LRRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.navigationItem.title = @"首页";
    //创建导航栏按钮
    [self addNavi];
    self.collectionView.mj_header =[LRRRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownRefreshRequest)];
    [self.collectionView.mj_header beginRefreshing];
    
}

- (void)lrr_topScrollviewImage
{
    [LRRHomeRequestManager homeTopScrollViewCompletion:^(LRRResponseObj *response) {
        LRRLog(@"%@",response);
        self.imageArray = [LRRSlideShowModel mj_objectArrayWithKeyValuesArray:response.data];
        [self.headerView homeHeaderViewImage:self.imageArray];
    } aboveView:self.view inCaller:self];
}


- (void)dropDownRefreshRequest
{
    [self lrr_hostLiveLocation:YES];
}

- (void)lrr_hostLiveLocation:(BOOL)refresh
{
    __block CGFloat longitude;
    __block CGFloat latitude;
    weakSelf(self);
    [self.locationHelper getUserCurrentLocation:^(CLLocation *location) {
        
        [weakself.locationHelper clearLocationDelegate];
        weakself.locationHelper = nil;
        
        CLLocationCoordinate2D coordinate = location.coordinate;
        longitude = coordinate.longitude;
        latitude = coordinate.latitude;
        [weakself setupUserLongitude:longitude Latitude:latitude Refresh:refresh];
        
        [self.locationHelper getUserNearbyPois:^(BMKReverseGeoCodeResult *result) {
            LRRLog(@"城市信息:%@ 地址设计:%@",result.addressDetail.city,result.address);
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_dingwei" highImage:@"icon_dingwei" Title:result.addressDetail.city target:self action:@selector(locationAction)];
        } location:location];
    }];
}

#pragma mark - 获取经纬度
- (void)setupUserLongitude:(CGFloat )longitude Latitude:(CGFloat)latitude Refresh:(BOOL)refresh
{
    [LRRPublishOrderRequestManager publishLookWorkerPageNum:1 Rows:4 Type:@"BOSS" completion:^(NSArray<LRRUserMessageModel *> *responseObj) {
        
        if (!responseObj) {
             [self.collectionView.mj_header endRefreshing];
        }else{ //有数据
            [self.collectionView.mj_header endRefreshing];
            [self.bossArray removeAllObjects];
            [self.bossArray addObjectsFromArray:responseObj];
            [self.datasource addObject:self.bossArray];
        }
        [self setUpWorker];
        
    } aboveView:self.view inCaller:self];
}

#pragma mark - 获取工人的信息
- (void)setUpWorker
{
    [LRRPublishOrderRequestManager publishLookWorkerPageNum:1 Rows:4 Type:@"WORKER" completion:^(NSArray<LRRUserMessageModel *> *responseObj) {
        
        if (!responseObj) {
            [self.collectionView.mj_header endRefreshing];
        }else{ //有数据
            [self.collectionView.mj_header endRefreshing];
            [self.workerArray removeAllObjects];
            [self.workerArray addObjectsFromArray:responseObj];
            [self.datasource addObject:self.workerArray];
        }
        [self.collectionView reloadData];
        [self lrr_topScrollviewImage];
        
    } aboveView:self.view inCaller:self];
}

#pragma mark - UICollectionViewDelegate or Datasource;
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.datasource[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.datasource.count;
}

// 设置section头视图的参考大小，与tableheaderview类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    if(section == 0){
        return CGSizeMake(kMainScreenWidth, headerHeight);
    }else if(section == 1){
        return CGSizeMake(kMainScreenWidth, 50);
    }else{
        return CGSizeZero;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LRRUserMessageModel *model = self.datasource[indexPath.section][indexPath.row];
    LRRHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[LRRHomeCollectionViewCell homeCollectionIdentifier] forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"%ld",indexPath.item);
    LRRUserMessageModel *model = self.datasource[indexPath.section][indexPath.row];
    LRRUserDetailedViewController *userVC = [[LRRUserDetailedViewController alloc]init];
    userVC.userMessageModel = model;
    userVC.isUser = 2;
    [self.navigationController pushViewController:userVC animated:YES];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 1) {
            LRRHomeCollectionReusableView *headerSection = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LRRHomeCollectionReusableView identifier] forIndexPath:indexPath];
            
            //        NSMutableArray *imgUrl = [NSMutableArray array];
            //        [self.imageArray enumerateObjectsUsingBlock:^(SNHStudyCycleModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //            [imgUrl addObject:obj.imgUrl];
            //        }];
            
            headerSection.delegate = self;
            //        header.cycleScrollView.imageURLStringsGroup = nil;
            //        header.cycleScrollView.imageURLStringsGroup = imgUrl;
            //
            //        if (self.goodsName.length) header.titleLabel.text = self.goodsName;
            //        if (self.categoryDescription.length) header.subTitleLabel.text = self.categoryDescription;
            
            return headerSection;
        }else{
            self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LRRHomeHeaderView identifier] forIndexPath:indexPath];
            self.headerView.firstDelegate = self;
            return self.headerView;
        }
    }else{
        return nil;
    }
}

#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_xiaoxi" highImage:@"icon_xiaoxi" target:self action:@selector(messageAction)];
}

#pragma mark - 点击事件
- (void)messageAction
{
    LRRLog(@"点击信息");
    if (![LRRUserManager sharedUserManager].logined) {
        LRRLoginViewController *loginVC = [[LRRLoginViewController alloc]initWithNibName:NSStringFromClass([LRRLoginViewController class]) bundle:nil];
        [self presentViewController:loginVC animated:YES completion:nil];
    }else{        
        LRRWebViewController *webVC = [[LRRWebViewController alloc]init];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }
}
- (void)locationAction
{
    LRRLog(@"定位");
    LRRLog(@"%@",[LRRUserManager sharedUserManager].currentUser.userId);
    LRRLog(@"%@",[LRRUserManager sharedUserManager].currentUser);
}

- (void)selectedButtonClick:(UIButton *)sender
{
    LRRLog(@"%@",sender);
    LRRLog(@"优秀工人更多");
    
    LRREmployingViewController *employVC = [[LRREmployingViewController alloc]init];
    employVC.titleType = @"WORKER";
    [self.navigationController pushViewController:employVC animated:YES];
}

- (void)selectedFirstButtonClick:(UIButton *)sender
{
    if (sender.tag == 1000) {
        LRRLog(@"新闻更多");
    }else{
        LRRLog(@"优秀老板更多");
        LRREmployingViewController *employVC = [[LRREmployingViewController alloc]init];
        employVC.titleType = @"BOSS";
        [self.navigationController pushViewController:employVC animated:YES];
    }
}


#pragma mark - 懒加载

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//        flowLayout.headerReferenceSize = CGSizeMake(kMainScreenWidth, 50);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-kNaviHeight) collectionViewLayout:flowLayout];
        _collectionView.alwaysBounceVertical = YES;
        flowLayout.minimumLineSpacing = 20;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.itemSize = CGSizeMake((kMainScreenWidth - 40-72)/4, LRRAdaptedHeight(130));
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 20, 5, 20);
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LRRHomeCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[LRRHomeCollectionViewCell homeCollectionIdentifier]];
         [_collectionView registerClass:[LRRHomeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LRRHomeCollectionReusableView identifier]];
        [_collectionView registerClass:[LRRHomeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LRRHomeHeaderView identifier]];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}

- (void)dealloc
{
    LRRLogFunc;
}

- (NSMutableArray *)datasource
{
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (NSMutableArray *)bossArray
{
    if (!_bossArray) {
        _bossArray = [NSMutableArray array];
    }
    return _bossArray;
}

- (NSMutableArray *)workerArray
{
    if (!_workerArray) {
        _workerArray = [NSMutableArray array];
    }
    return _workerArray;
}

- (LRRLocationHelper *)locationHelper{
    if (!_locationHelper) {
        _locationHelper = [[LRRLocationHelper alloc] init];
    }
    return _locationHelper;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
