//
//  LRRSexField.m
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSexField.h"

@interface LRRSexField ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, weak) UIPickerView *pickerView;
@property (nonatomic, assign) BOOL isInitial;
@property (nonatomic, strong) NSString *selectedText;

@end

@implementation LRRSexField
// 初始化文字的方法
- (void)initialText
{
    if (_isInitial == NO) {
        
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
        _isInitial = YES;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

// 初始化
- (void)setUp
{
    
    self.borderStyle = UITextBorderStyleNone;
    
    // 创建pickerView
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    pickerView.backgroundColor = [UIColor whiteColor];
    
    _pickerView = pickerView;
    
    pickerView.dataSource = self;
    
    pickerView.delegate = self;
    
    // 自定义文本框键盘
    self.inputView = pickerView;
    
    
    UIView *toolbar = [UIView new];
    toolbar.backgroundColor = UIColorHex(f8f9f9);
    toolbar.dl_height = LRRItemHeight;
    self.inputAccessoryView = toolbar;
    
    UIView *toplineView = [UIView new];
    toplineView.backgroundColor = LRRSeparatorColor;
    [toolbar addSubview:toplineView];
    [toplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(toolbar);
        make.height.mas_equalTo(LRROnePixelHeight);
    }];
    
    UIView *bottomlineView = [UIView new];
    bottomlineView.backgroundColor = LRRSeparatorColor;
    [toolbar addSubview:bottomlineView];
    [bottomlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(toolbar);
        make.height.mas_equalTo(LRROnePixelHeight);
    }];
    
    UIButton *ensureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (@available(iOS 8.2, *)) {
        ensureButton.titleLabel.font = LRRRegularFont(16);
    } else {
        // Fallback on earlier versions
    }
    [ensureButton setTitle:@"确定" forState:UIControlStateNormal];
    [ensureButton addTarget:self action:@selector(ensureButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [ensureButton setTitleColor:LRROrangeThemeColor forState:UIControlStateNormal];
    [toolbar addSubview:ensureButton];
    [ensureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(toolbar);
        make.right.equalTo(toolbar).with.offset(-LRRRightPadding);
    }];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (@available(iOS 8.2, *)) {
        cancelButton.titleLabel.font = LRRRegularFont(16);
    } else {
        // Fallback on earlier versions
    }
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitleColor:LRRSexTimeTextColor forState:UIControlStateNormal];
    [toolbar addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(toolbar);
        make.left.equalTo(toolbar).with.offset(LRRLeftPadding);
    }];
    
}

- (void)ensureButtonAction{
    self.text = self.selectedText;
    if ([self.sexDelegate respondsToSelector:@selector(ensureButtonClicked)]) {
        [self.sexDelegate ensureButtonClicked];
    }
    [self cancelButtonAction];
}

- (void)cancelButtonAction{
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder{
    [self initialText];
    return [super becomeFirstResponder];
}

#pragma mark - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
// 返回每一行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return row ? @"男" : @"女";
}


// 选中某一行的时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _selectedText = row ? @"男" : @"女";
}

- (void)dealloc{
    LRRLogFunc
}



@end
