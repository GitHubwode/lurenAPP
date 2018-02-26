//
//  LRRSegmentBarVC.m
//  LuRen
//
//  Created by Ding on 2018/1/21.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSegmentBarVC.h"

@interface LRRSegmentBarVC ()<LRRSegmentBarDelegate,UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView * contentView;


@end

@implementation LRRSegmentBarVC

- (LRRSegmentBar *)segmentBar{
    if (!_segmentBar) {
        LRRSegmentBar *segmentBar = [LRRSegmentBar segmentBarWithFrame:self.view.bounds];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor greenColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs
{
    NSAssert(items.count != 0 || items.count == childVCs.count, @"个数不一致, 请自己检查");
    self.segmentBar.items = items;
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }
    self.contentView.contentSize = CGSizeMake(items.count * self.view.dl_width, 0);
    self.segmentBar.selectIndex = 0;
}


- (void)showChildVCViewAtIndex:(NSInteger)index{
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.dl_width, 0, self.contentView.dl_width, self.contentView.dl_height);
    [self.contentView addSubview:vc.view];
    // 滑动到对应位置
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.dl_width, 0) animated:YES];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    if (self.segmentBar.superview == self.view) {
        self.segmentBar.frame = CGRectMake(0, 60, self.contentView.dl_width, 35);
        CGFloat contentViewY = self.segmentBar.dl_y + self.segmentBar.dl_height;
        CGRect contentFrame = CGRectMake(0, contentViewY, self.view.dl_width, self.view.dl_height - contentViewY);
        self.contentView.frame = contentFrame;
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.dl_width, 0);
        return;
    }
    CGRect contentFrame = CGRectMake(0, 0, self.view.dl_width, self.view.dl_height);
    self.contentView.frame = contentFrame;
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.dl_width, 0);
    self.segmentBar.selectIndex = self.segmentBar.selectIndex;
}


#pragma mark - LLSegmentBarDelegate
- (void)segmentBar:(LRRSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex{
    [self showChildVCViewAtIndex:toIndex];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = self.contentView.contentOffset.x/self.contentView.dl_width;
    self.segmentBar.selectIndex = index;
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
