//
//  LRRBirthdayField.m
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRBirthdayField.h"

@interface LRRBirthdayField ()

@property (nonatomic, weak) UIDatePicker *dateP;
@property (nonatomic, strong) NSString *selectedText;
@property (nonatomic, assign) BOOL isInitial;

@end

@implementation LRRBirthdayField

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


// 初始化文字的方法
- (void)initialText
{
    if (_isInitial == NO) {
        
        [self dateChamge:self.dateP];
        _isInitial = YES;
    }
}

// 初始化
- (void)setUp
{
    self.borderStyle = UITextBorderStyleNone;
    // 创建日期选择控件
    UIDatePicker *dateP = [[UIDatePicker alloc] init];
    dateP.backgroundColor = [UIColor whiteColor];
    // 设置日期模式,年月日
    dateP.datePickerMode = UIDatePickerModeDate;
    
    // 设置地区 zh:中国标识
    dateP.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    dateP.maximumDate = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    dateP.minimumDate = [fmt dateFromString:@"1900-01-01"];
    
    [dateP addTarget:self action:@selector(dateChamge:) forControlEvents:UIControlEventValueChanged];
    self.dateP = dateP;
    // 自定义文本框的键盘
    self.inputView = dateP;
    
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

// 只要UIDatePicker选中的时候调用
- (void)dateChamge:(UIDatePicker *)picker{
    // 2015-09-06 yyyy-MM-dd
    // 创建一个日期格式字符串对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    self.selectedText = [fmt stringFromDate:picker.date];
}

- (void)ensureButtonAction{
    self.text = self.selectedText;
    if ([self.birthdayDelegate respondsToSelector:@selector(ensureButtonClicked)]) {
        [self.birthdayDelegate ensureButtonClicked];
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

- (BOOL)canBecomeFirstResponder{
    return YES;
}


@end
