//
//  LRRWebViewController.m
//  LuRen
//
//  Created by Ding on 2018/5/5.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRWebViewController.h"
#import <WebKit/WebKit.h>
/// 控件高度
#define kBottomViewH 44

@interface LRRWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) UIProgressView *mineProgressView;
@property(strong, nonatomic) WKWebView *webView;
@property (nonatomic, strong) NSURLRequest *request;
@property (weak, nonatomic) UIButton *backBtn;
@property (weak, nonatomic) UIButton *forwardBtn;
@property (weak, nonatomic) UIButton *reloadBtn;
//@property (weak, nonatomic) UIButton *browserBtn;
/// 网页控制导航栏
@property (weak, nonatomic) UIView *bottomView;
@end

@implementation LRRWebViewController
- (void)dealloc{
    LRRLogFunc
    [self deleteWebCache];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"加载中...";
    _mineProgressView = [[UIProgressView alloc] init];
    _mineProgressView.trackTintColor = [UIColor whiteColor];
    _mineProgressView.progressTintColor = LRROrangeThemeColor;
    [self.view addSubview:_mineProgressView];
    [_mineProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    
    self.webView.backgroundColor = LRRViewBackgroundColor;
    self.view.backgroundColor = LRRViewBackgroundColor;
    WKWebViewConfiguration *con = [[WKWebViewConfiguration alloc] init];
    con.allowsInlineMediaPlayback = YES;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64-44) configuration:con];
    self.webView.navigationDelegate = self;
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view insertSubview:self.webView belowSubview:_mineProgressView];

    NSString *urlString = @"https://mp.weixin.qq.com/mp/homepage?__biz=MzUxMTc2OTI2OQ==&hid=1&sn=530a25e61bcaf3b630fb2ec95a6b88af&scene=1&devicetype=android-24&version=26060532&lang=zh_CN&nettype=WIFI&ascene=7&session_us=gh_3c30d7b38e27&wx_header=1";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    self.request = request;
    [self refreshData];
    [self addSubViews];
}

- (void)addSubViews {
    [self addBottomViewButtons];
}

- (void)addBottomViewButtons {
    // 记录按钮个数
    int count = 0;
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"后退" forState:UIControlStateNormal];
    [button setTitleColor:LRROrangeThemeColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    button.tag = ++count;    // 标记按钮
    [button addTarget:self action:@selector(onBottomButtonsClicled:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:button];
    self.backBtn = button;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"前进" forState:UIControlStateNormal];
    [button setTitleColor:LRROrangeThemeColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    button.tag = ++count;
    [button addTarget:self action:@selector(onBottomButtonsClicled:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:button];
    self.forwardBtn = button;
    // 刷新按钮
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"重新加载" forState:UIControlStateNormal];
    [button setTitleColor:LRROrangeThemeColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    button.tag = ++count;
    [button addTarget:self action:@selector(onBottomButtonsClicled:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:button];
    self.reloadBtn = button;
    // 统一设置frame
    [self setupBottomViewLayout];
}
- (void)setupBottomViewLayout
{
    int count = 3;
    CGFloat btnW = 80;
    CGFloat btnH = 30;
    
    CGFloat btnY = (self.bottomView.bounds.size.height - btnH) / 2;
    // 按钮间间隙
    CGFloat margin = (self.bottomView.bounds.size.width - btnW * count) / count;
    
    CGFloat btnX = margin * 0.5;
    self.backBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    btnX = self.backBtn.frame.origin.x + btnW + margin;
    self.forwardBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    btnX = self.forwardBtn.frame.origin.x + btnW + margin;
    self.reloadBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    btnX = self.reloadBtn.frame.origin.x + btnW + margin;
//    self.browserBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
}

/// 刷新按钮是否允许点击
- (void)refreshBottomButtonState {
    if ([self.webView canGoBack]) {
        self.backBtn.enabled = YES;
    } else {
        self.backBtn.enabled = NO;
    }
    
    if ([self.webView canGoForward]) {
        self.forwardBtn.enabled = YES;
    } else {
        self.forwardBtn.enabled = NO;
    }
}
/// 按钮点击事件
- (void)onBottomButtonsClicled:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
        {
            [self.webView goBack];
            [self refreshBottomButtonState];
        }
            break;
        case 2:
        {
            [self.webView goForward];
            [self refreshBottomButtonState];
        }
            break;
        case 3:
            [self.webView reload];
            break;
        case 4:
            [[UIApplication sharedApplication] openURL:self.webView.URL];
            break;
        default:
            break;
    }
}

- (void)refreshData
{
    [self.webView loadRequest:self.request];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    [self.mineProgressView setProgress:[change[@"new"]floatValue] animated:YES];
    
    //加载完成移除进度条
    self.mineProgressView.hidden = self.mineProgressView.progress >= 1;
    if (self.mineProgressView.hidden) {
        self.mineProgressView.progress = 0.f;
    }
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
   
    self.navigationItem.title = @"网工宝";
}


- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
    LRRLog(@"%@",error);
    [self.view showHint:@"网络不给力呀，请稍后再试~"];
}
- (void)deleteWebCache {
    
    if (@available(iOS 9.0, *)) {
        NSSet *websiteDataTypes
        
        = [NSSet setWithArray:@[
                                
                                WKWebsiteDataTypeDiskCache,
                                WKWebsiteDataTypeMemoryCache,
                                ]];
        
        
        
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        
        //// Execute
        
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            
            // Done
            
        }];
    } else {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        
        NSError *errors;
        
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
        // Fallback on earlier versions
    }
    
}

#pragma mark - 懒加载
- (UIView *)bottomView {
    if (_bottomView == nil) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kMainScreenHeight - kBottomViewH-64, kMainScreenWidth, kBottomViewH)];
        view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        [self.view addSubview:view];
        _bottomView = view;
    }
    return _bottomView;
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
