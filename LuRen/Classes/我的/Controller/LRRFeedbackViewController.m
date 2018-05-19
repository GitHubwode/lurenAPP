//
//  LRRFeedbackViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRFeedbackViewController.h"
#import "UITextView+Placeholder.h"
#import "LRRReportRequestManager.h"
#import "LRRReportParam.h"

@interface LRRFeedbackViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, copy) NSString *remarkString;
@property (nonatomic, assign) NSInteger maxLenght;


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
    self.maxLenght = 120;
    if ([self.titleString isEqualToString:@"举报"]) {
        
    }else{
        self.titleString = @"意见反馈";
    }
    self.navigationItem.title = self.titleString;
    [self setUpSubViws];
    
}

- (void)setUpSubViws{
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = UIColorHex(0xffffff);
    [self.view addSubview:bgView];
    
    weakSelf(self);
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view).with.offset(15.f);
        make.left.equalTo(weakself.view).with.offset(LRRLeftPadding);
        make.right.equalTo(weakself.view).with.offset(-LRRRightPadding);
        make.height.mas_equalTo(200.f);
    }];
    
    _textView = [[UITextView alloc] init];
    _textView.textColor = LRRTimeTextColor;
    _textView.tintColor = LRROrangeThemeColor;
    _textView.delegate = self;
    _textView.font = LRRFont(14);
    _textView.scrollsToTop = NO;
    _textView.showsVerticalScrollIndicator = NO;
    _textView.showsHorizontalScrollIndicator = NO;
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.placeholder = @" 您的意见对我们很重要";
    _textView.placeholderColor = LRRTimeTextColor;
    _textView.textContainer.lineFragmentPadding = 0.f;
    _textView.textContainerInset = UIEdgeInsetsZero;
    [bgView addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top).offset(5);
        make.left.equalTo(bgView.mas_left).offset(5);
        make.right.equalTo(bgView.mas_right).offset(-5);
        make.height.mas_equalTo(190.f);
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
    //举报人ID reportId
    //举报人电话号码reportPhone
    //被举报人电话 reportedPhone
    //举报内容reportContent
    NSString *userId = [LRRUserManager sharedUserManager].currentUser.userId;
    NSString *phoneId = [LRRUserManager sharedUserManager].currentUser.phone;
    
    if ([self.titleString isEqualToString:@"举报"]) {
        LRRReportParam *param = [[LRRReportParam alloc]initWithReportId:[userId integerValue] OrderNo:self.orderNo ReportContent:self.remarkString ReportedPhone:self.reportedPhone ReportPhone:phoneId];
        [LRRReportRequestManager reportOrderParam:param completion:^(LRRResponseObj *responseObj) {
            if (responseObj.code == LRRSuccessCode) {
                [self.view showHint:@"您的举报对我们很重要谢谢"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }
            LRRLog(@"举报信息");
        } aboveView:self.view inCaller:self];
    }else{
        [LRRReportRequestManager freedBackOrderContent:self.remarkString completion:^(LRRResponseObj *responseObj) {
            if (responseObj.code == LRRSuccessCode) {
                [self.view showHint:@"您的意见对我们很重要谢谢"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }
        } aboveView:self.view inCaller:self];
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    self.submitButton.enabled = _textView.text.length;
}

#pragma mark - UITextView
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.remarkString = textView.text;
    [LRRNotificationCenter addObserver:self selector:@selector(textViewEditChanged:) name:UITextViewTextDidChangeNotification object:textView];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.remarkString = textView.text;
    [LRRNotificationCenter removeObserver:self];
}

- (void)textViewEditChanged:(NSNotification *)noti
{
    UITextView *textView = (UITextView *)noti.object;
    NSInteger maxLength = self.maxLenght;
    if (maxLength == 0) maxLength = NSIntegerMax;
    NSString *toBeString = textView.text;
    
    NSString *lang = [[textView textInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        if (position) return;
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (toBeString.length <= maxLength) return;
        
        textView.text = [toBeString substringToIndex:maxLength];
        
    }else{ // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length <= maxLength) return;
        textView.text = [toBeString substringToIndex:maxLength];
    }
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [self.textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    if ([[textView textInputMode] primaryLanguage] == nil || [[[textView textInputMode]primaryLanguage]isEqualToString:@"emoji"]) {
        return NO;
    }
    
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        if (offsetRange.location < self.maxLenght) {
            return YES;
        }else{
            LRRLog(@"字数");
            [self.view showHint:@"输入的字符为120"];
            return YES;
        }
    }
    return YES;
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
