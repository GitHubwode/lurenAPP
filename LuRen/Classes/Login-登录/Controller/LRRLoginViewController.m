//
//  LRRLoginViewController.m
//  LuRen
//
//  Created by Ding on 2018/2/26.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLoginViewController.h"
#import "LRRLoginRequestManager.h"

@interface LRRLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *downTimeButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (nonatomic, assign) NSUInteger maxTextLength;
@property (weak, nonatomic) IBOutlet UIButton *downTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LRRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupForDismissKeyboard];
    self.loginButton.enabled = NO;
    UIImage *image = [UIImage imageNamed:@"启动页"];
    self.bgImageView.image=[UIImage LRR_boxblurImage:image withBlurNumber:0.5];
    self.bgImageView.clipsToBounds=YES;
    [self.view addSubview:self.bgImageView];
    self.bgView.backgroundColor = LRRColorA(199, 199, 199, 153);
    [self.bgImageView addSubview:self.bgView];
    self.phoneTextFiled.delegate = self;
    self.codeTextField.delegate = self;
}

- (IBAction)downTimeButtonClick:(UIButton *)sender {
    LRRLog(@"倒计时");
    BOOL isMatch = [self isRealyPhone];
    
    if (isMatch) {
        [self setUpCodeRequest];
    }
}

- (void)startCountDown
{
     [self.downTimeBtn startWithTime:60 title:@"获取验证码" subTitle:@"秒后重发" normalBackgroundColor:LRROrangeThemeColor coundownBackgroundColor:LRRAlertTextColor completion:nil];
}

#pragma mark - 获取验证码的网络请求
- (void)setUpCodeRequest
{
    [self.view showHUD];
    long time1 = [[NSString publishSetUpNowTime] longLongValue];
    NSString *codeType = @"DRAW_BANK_PWD";
    NSString *sig = [NSString stringWithFormat:@"%@%@%ld%@",self.phoneTextFiled.text,codeType,time1,LRRAesKey];
    NSString *sig1 = [sig md5String];
    
    LRRSMSCodeParam *param = [[LRRSMSCodeParam alloc]initWithPhone:self.phoneTextFiled.text Type:codeType Timestamp:time1 Signature:sig1];
    
    weakSelf(self);
    
    [LRRLoginRequestManager sendVerificationCodeToCellParam:param completion:^(LRRResponseObj *responseObj) {
        [weakself.view hideHUD];
        
        if (!responseObj) {
            [self.view showHint:LRRHttpNerworkErrorTip];
        }else if (responseObj.code != LRRSuccessCode){
            [self.view showHint:responseObj.message];
        }else{
            [weakself startCountDown];
        }
    } inCaller:self];
}

- (IBAction)loginButtonClick:(UIButton *)sender {
    LRRLog(@"登录");
    
    NSString *codeSMS = self.codeTextField.text;
    if (!codeSMS.length){
        [MBProgressHUD showMessag:@"请填写验证码"];
        return;
    };
    
    LRRLoginParam *loginParam = [[LRRLoginParam alloc]initWithPhone:self.phoneTextFiled.text password:nil SmsCode:self.codeTextField.text Mode:@""];
    
    [LRRLoginRequestManager loginWithParam:loginParam completion:^(LRRUserInfo *user) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    } aboveView:self.view inCaller:self];

}
- (IBAction)userAgreementButtonClick:(UIButton *)sender {
    LRRLog(@"用户协议");
}

#pragma mark - 判断电话号码是否正确
- (BOOL)isRealyPhone
{
    NSString *cellPhone = self.phoneTextFiled.text;
    if (!cellPhone.length){
        [MBProgressHUD showMessag:@"请填写手机号码"];
        return NO;
    };
    
    // 1.对用户输入的手机号进行正则匹配
    BOOL isMatch = [cellPhone isPhoneNumer];
    // 2.对不同的匹配结果做处理
    if (!isMatch){ // 不是正规的手机号码
        [MBProgressHUD showMessag:@"请输入正确格式的手机号码"];
        return NO;
    }
    return YES;
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.phoneTextFiled) {
        self.maxTextLength = 11;
    }else{
        self.maxTextLength = 4;
    }
    [LRRNotificationCenter addObserver:self selector:@selector(textFiledEditChanged:)name:UITextFieldTextDidChangeNotification object:textField];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    BOOL isMatch = [self isRealyPhone];
    
    if (isMatch) {
        if ((textField == self.codeTextField && self.codeTextField.text.length == 4) ||self.codeTextField.text.length == 4 ) {
            self.loginButton.enabled = YES;
            [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
            [self.loginButton setTitleColor:UIColorHex(0xffffff) forState:UIControlStateNormal];
            [self.loginButton setBackgroundImage:[UIImage imageNamed:@"icon_btn"] forState:UIControlStateNormal];
        }
    }
    [LRRNotificationCenter removeObserver:self];
}

-(void)textFiledEditChanged:(NSNotification *)noti{
    
    UITextField *textField = (UITextField *)noti.object;
    
    NSInteger maxLength = self.maxTextLength;
    
    if (maxLength == 0) maxLength = NSIntegerMax;
    NSString *toBeString = textField.text;
    NSString *lang = [[textField textInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        if (position) return;
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (toBeString.length <= maxLength) return;
        
        textField.text = [toBeString substringToIndex:maxLength];
        
    }else{ // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length <= maxLength) return;
        textField.text = [toBeString substringToIndex:maxLength];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (self.phoneTextFiled == textField) {
        if (textField.text.length > 11) {
            return YES;
        }
    }
    
    NSString *tem = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    if (![string isEqualToString:tem]) {
        return NO;
    }
    return YES;
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
