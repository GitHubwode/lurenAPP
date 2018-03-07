//
//  LRRChangePhoneViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/7.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRChangePhoneViewController.h"

@interface LRRChangePhoneViewController ()<UITextFieldDelegate>
    
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *downButton;

@end

@implementation LRRChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改手机号";
    [self setupForDismissKeyboard];
}
- (IBAction)sureButtonClick:(UIButton *)sender {
    
}
- (IBAction)downTimeButtonClick:(UIButton *)sender {
    [sender startWithTime:60 title:@"获取验证码" subTitle:@"秒后重发" normalBackgroundColor:LRROrangeThemeColor coundownBackgroundColor:LRRAlertTextColor completion:nil];
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
