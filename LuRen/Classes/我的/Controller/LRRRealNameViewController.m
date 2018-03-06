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
