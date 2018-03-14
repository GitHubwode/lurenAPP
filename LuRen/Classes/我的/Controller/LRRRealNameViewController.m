//
//  LRRRealNameViewController.m
//  LuRen
//
//  Created by Ding on 2018/3/5.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRRealNameViewController.h"
#import "LCActionSheet.h"

@interface LRRRealNameViewController ()<UITextFieldDelegate,LCActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *_ipc;
}

@property (weak, nonatomic) IBOutlet UIImageView *IDUpImageView;
@property (weak, nonatomic) IBOutlet UIImageView *IDDownImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconUpImageView;
@property (weak, nonatomic) IBOutlet UILabel *UpLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconDownImageView;
@property (weak, nonatomic) IBOutlet UILabel *downLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *IDTextField;
@property (nonatomic, assign) NSUInteger IdIndex;//哪一个图片

@end

@implementation LRRRealNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"实名认证";
    self.nameTextField.delegate = self;
    self.IDTextField.delegate = self;
    if (!_ipc) {
        _ipc = [[UIImagePickerController alloc]init];
    }
    _ipc.delegate = self;
    _ipc.allowsEditing = YES;
    // 设置点击空白区域键盘收回
    [self setupForDismissKeyboard];
}

- (void)changePhotoImageView
{
    LCActionSheet *sheet = [LCActionSheet sheetWithTitle:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [sheet show];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [LRRNotificationCenter addObserver:self selector:@selector(textFiledEditChanged:)name:UITextFieldTextDidChangeNotification object:textField];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.nameTextField) {
        self.nameTextField.text = textField.text;
    }else{
        self.IDTextField.text = textField.text;
    }
    [LRRNotificationCenter removeObserver:self];
}

-(void)textFiledEditChanged:(NSNotification *)noti{
    
    UITextField *textField = (UITextField *)noti.object;
    
    NSInteger maxLength;
    
    if (textField == self.nameTextField) {
        maxLength = 8;
    }else{
        maxLength = 18;
    }
    
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
    
    if (textField == self.nameTextField) {
        if (textField.text.length > 10) {
            return YES;
        }
    }
    
    NSString *tem = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    if (![string isEqualToString:tem]) {
        return NO;
    }
    return YES;
}


#pragma mark -LCActionSheetDelegate
- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[[UIDevice currentDevice]systemName]floatValue]>= 8.0) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    
    if (buttonIndex == 1) {
         LRRLog(@"打开摄像头");       
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        _ipc.sourceType = sourceType;
        [self presentViewController:_ipc animated:YES completion:nil];
    }else if (buttonIndex == 2){
         LRRLog(@"打开相册");
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _ipc.sourceType = sourceType;
        [self presentViewController:_ipc animated:YES completion:nil];
    }
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *pageImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!pageImage) {
        pageImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if (self.IdIndex == 1) {
        self.IDUpImageView.image = pageImage;
        [self.iconUpImageView removeFromSuperview];
        [self.UpLabel removeFromSuperview];
    }else{
        [self.iconDownImageView removeFromSuperview];
        [self.downLabel removeFromSuperview];
        self.IDDownImageView.image = pageImage;
    }
    [self lrr_certificationIDImage:pageImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 上传阿里云图片服务器
- (void)lrr_certificationIDImage:(UIImage *)image
{
    LRRLog(@"上传阿里云服务器");
}

- (IBAction)faceIDUpTapRegisture:(UITapGestureRecognizer *)sender {
    LRRLog(@"身份证正面");
    
    self.IdIndex = 1;
    [self changePhotoImageView];
    
}
- (IBAction)faceIDDownTapRegisture:(UITapGestureRecognizer *)sender {
    LRRLog(@"身份证反面");
    self.IdIndex = 2;
    [self changePhotoImageView];
    
}
- (IBAction)submitButtonClick:(UIButton *)sender {
    LRRLog(@"提交信息");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    LRRLogFunc
}

@end
