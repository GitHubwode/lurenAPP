//
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

//测试
#import "LRRLoginViewController.h"

static CGFloat headerHeight = 182.f;

@interface LRRHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LRRHomeCollectionReusableViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) LRRHomeHeaderView *headerView;

@end

@implementation LRRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self addMiddleNaviView];
    //创建导航栏按钮
    [self addNavi];
}

- (void)addMiddleNaviView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 12)];
    UIImageView *img = [[UIImageView alloc] initWithFrame:view.frame];
    img.image = [UIImage imageNamed:@"logo"];
    img.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:img];
    self.navigationItem.titleView = view;
}

#pragma mark - UICollectionViewDelegate or Datasource;
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LRRHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[LRRHomeCollectionViewCell homeCollectionIdentifier] forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LRRLog(@"%ld",indexPath.item);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
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
        return nil;
    }
}

#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_xiaoxi" highImage:@"icon_xiaoxi" target:self action:@selector(messageAction)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_dingwei" highImage:@"icon_dingwei" Title:@" 杭州" target:self action:@selector(locationAction)];
}

#pragma mark - 点击事件
- (void)messageAction
{
    LRRLog(@"点击信息");
    LRRLoginViewController *loginVC = [[LRRLoginViewController alloc]initWithNibName:NSStringFromClass([LRRLoginViewController class]) bundle:[NSBundle mainBundle]];
    [self presentViewController:loginVC animated:YES completion:nil];
}
- (void)locationAction
{
    LRRLog(@"定位");
}

- (void)selectedButtonClick:(UIButton *)sender
{
    LRRLog(@"%@",sender);
}


#pragma mark - 懒加载

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.headerReferenceSize = CGSizeMake(kMainScreenWidth, 50);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight) collectionViewLayout:flowLayout];
        flowLayout.minimumLineSpacing = 20;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.itemSize = CGSizeMake((kMainScreenWidth - 40-72)/4, LRRAdaptedHeight(130));
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 20, 5, 20);
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LRRHomeCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[LRRHomeCollectionViewCell homeCollectionIdentifier]];
         [_collectionView registerClass:[LRRHomeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LRRHomeCollectionReusableView identifier]];
        _collectionView.contentInset = UIEdgeInsetsMake(headerHeight, 0, 0, 0);
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView addSubview:self.headerView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (LRRHomeHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LRRHomeHeaderView alloc]initWithFrame:CGRectMake(0, -headerHeight, kMainScreenWidth,headerHeight)];
    }
    return _headerView;
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
