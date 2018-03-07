//
//  LRRLoginViewController.m
//  LuRen
//
//  Created by Ding on 2018/2/26.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRLoginViewController.h"

@interface LRRLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *downTimeButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation LRRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupForDismissKeyboard];
    UIImage *image = [UIImage imageNamed:@"启动页"];
    self.bgImageView.image=[UIImage LRR_boxblurImage:image withBlurNumber:0.5];
    self.bgImageView.clipsToBounds=YES;
    [self.view addSubview:self.bgImageView];
    self.bgView.backgroundColor = LRRColorA(199, 199, 199, 153);
    [self.bgImageView addSubview:self.bgView];
}

- (IBAction)downTimeButtonClick:(UIButton *)sender {
    LRRLog(@"倒计时");
    [sender startWithTime:60 title:@"获取验证码" subTitle:@"秒后重发" normalBackgroundColor:LRROrangeThemeColor coundownBackgroundColor:LRRAlertTextColor completion:nil];
    
}
- (IBAction)loginButtonClick:(UIButton *)sender {
    LRRLog(@"登录");
}
- (IBAction)userAgreementButtonClick:(UIButton *)sender {
    LRRLog(@"用户协议");
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
