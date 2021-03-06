//
//  LRRIntroduceViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/8.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRIntroduceViewCell.h"
#import "LRRCustomInfoItem.h"
#import "UITextView+Placeholder.h"

static NSString *LRRIntroduceViewIdfy = @"LRRIntroduceViewIdfy";


@interface LRRIntroduceViewCell ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) NSInteger maxLenght;


@end

@implementation LRRIntroduceViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.subTitleTextView.placeholder = infoItem.placeholder;
    self.subTitleTextView.text = infoItem.subtitle;
    self.maxLenght = infoItem.maxTextLength;
}

#pragma mark - UITextView
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (!self.infoItem.editabled) return;
    self.infoItem.subtitle = textView.text;
    [LRRNotificationCenter addObserver:self selector:@selector(textViewEditChanged:) name:UITextViewTextDidChangeNotification object:textView];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (!self.infoItem.editabled) return;
    self.infoItem.subtitle = textView.text;
    [LRRNotificationCenter removeObserver:self];
}

- (void)textViewEditChanged:(NSNotification *)noti
{
    UITextView *textView = (UITextView *)noti.object;
    NSInteger maxLength = self.infoItem.maxTextLength;
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
        [self.subTitleTextView resignFirstResponder];
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
//            [self.contentView showHint:@"输入的字符为50~60"];
            return YES;
        }
    }
    
    return YES;
}

+ (NSString *)cellIdentifier
{
    return LRRIntroduceViewIdfy;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
