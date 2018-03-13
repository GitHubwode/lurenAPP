//
//  LRRPublishLiveViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/12.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRPublishLiveViewCell.h"
#import "LRRCustomInfoItem.h"
#import "LRRDefineButton.h"
static NSString *LRRPublishLiveCellIdfy = @"LRRPublishLiveCellIdfy";


@interface LRRPublishLiveViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeight;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet LRRDefineButton *liveButton;
@property (weak, nonatomic) IBOutlet LRRDefineButton *liveNotButton;

@end

@implementation LRRPublishLiveViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineViewHeight.constant = LRROnePixelHeight;

}

- (void)setInfoItem:(LRRCustomInfoItem *)infoItem
{
    _infoItem = infoItem;
    self.titleLabel.text = infoItem.title;
    self.lineView.hidden = infoItem.hidenLine;
}
- (IBAction)liveButtonClick:(LRRDefineButton *)sender {
    sender.selected = !sender.selected;
    LRRLog(@"住");
    if (sender.selected) {
        self.liveNotButton.selected = NO;
    }else{
        self.liveNotButton.selected = YES;
    }
    [self publishLiveMessageString:@"住"];

}
- (IBAction)LiveNotButtonClick:(LRRDefineButton *)sender {
    sender.selected = !sender.selected;
    LRRLog(@"不住");
    if (sender.selected) {
        self.liveButton.selected = NO;
    }else{
        self.liveButton.selected = YES;
    }
    [self publishLiveMessageString:@"不住"];
}

- (void)publishLiveMessageString:(NSString *)string{
    if (self.infoItem.editabled) {
        self.infoItem.subtitle =string ;
    }
}

- (void)dealloc{
    LRRLogFunc
}

+ (NSString *)cellIdentifier{
    return LRRPublishLiveCellIdfy;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
