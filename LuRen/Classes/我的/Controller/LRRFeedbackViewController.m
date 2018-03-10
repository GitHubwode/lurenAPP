//
//  LRRFeedbackViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRFeedbackViewController.h"
#import "UITextView+Placeholder.h"


@interface LRRFeedbackViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation LRRFeedbackViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"意见反馈";
    [self setUpSubViws];
    
}

- (void)setUpSubViws{
    
    _textView = [[UITextView alloc] init];
    _textView.textColor = LRRTimeTextColor;
    _textView.tintColor = LRROrangeThemeColor;
    _textView.delegate = self;
    _textView.font = LRRFont(14);
    _textView.scrollsToTop = NO;
    _textView.showsVerticalScrollIndicator = NO;
    _textView.showsHorizontalScrollIndicator = NO;
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.placeholder = @"您的意见对我们很重要";
    _textView.placeholderColor = LRRTimeTextColor;
    _textView.textContainer.lineFragmentPadding = 0.f;
    _textView.textContainerInset = UIEdgeInsetsZero;
    [self.view addSubview:_textView];
    
    weakSelf(self);
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view).with.offset(15.f);
        make.left.equalTo(weakself.view).with.offset(LRRLeftPadding);
        make.right.equalTo(weakself.view).with.offset(-LRRRightPadding);
        make.height.mas_equalTo(200.f);
    }];
    
    [self.view addSubview:self.submitButton];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.view.mas_centerX);
        make.top.equalTo(weakself.textView.mas_bottom).offset(10);
        make.height.equalTo(@(45.f));
        make.width.equalTo(@(LRRAdaptedWidth(247.f)));
    }];
}

- (void)submitButtonClick:(UIButton *)sender
{
    LRRLog(@"提交");
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    self.submitButton.enabled = _textView.text.length;
}

- (UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitButton.enabled = NO;
        [_submitButton setTitleColor:UIColorHex(0xffffff) forState:UIControlStateNormal];
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        _submitButton.titleLabel.font = LRRFont(15);
        [_submitButton setBackgroundImage:[UIImage imageNamed:@"icon_btn"] forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}

- (void)dealloc
{
    LRRLogFunc
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
