//
//  LRRSettingClearCacheViewCell.m
//  LuRen
//
//  Created by Ding on 2018/3/14.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRSettingClearCacheViewCell.h"
#import <SDImageCache.h>

static NSString *settingClearCacheViewCell = @"settingClearCacheViewCell";

@interface LRRSettingClearCacheViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation LRRSettingClearCacheViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (NSString *)settingIdenfier
{
    return settingClearCacheViewCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
        [self setUp];

    }
    return self;
}

- (void)creatUI
{
    weakSelf(self);
    [self addSubview:self.nameLabel];
    [self addSubview:self.iconImageView];
    [self addSubview:self.subTitleLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.mas_centerY);
        make.left.equalTo(weakself.mas_left).offset(15);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.mas_right).offset(-15);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.iconImageView.mas_left).offset(-15);
    }];
    
}

#pragma mark - 懒加载
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = LRRFont(15);
        _nameLabel.textColor = UIColorHex(0x777777);
    }
    return _nameLabel;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"icon_arrow"];
        _iconImageView.hidden = YES;
    }
    return _iconImageView;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel new];
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
        _subTitleLabel.font = LRRFont(15);
        _subTitleLabel.textColor = UIColorHex(0x777777);
    }
    return _subTitleLabel;
}

- (void)setUp{
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [loadingView startAnimating];
    self.accessoryView = loadingView;
    
    self.subTitleLabel.text = @"正在计算";
    self.userInteractionEnabled = NO;

    weakSelf(self);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1.0];
        unsigned long long size  = 0;
        
        NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
        NSFileManager *filemanager = [NSFileManager defaultManager];
        
        NSArray *subPaths = [filemanager subpathsOfDirectoryAtPath:cacheFilePath error:nil];

        //遍历所有子文件
        
        for (NSString *subPath in subPaths) {
            
            //1）.拼接完整路径
            
            NSString *filePath = [cacheFilePath stringByAppendingFormat:@"/%@",subPath];
            
            //2）.计算文件的大小
            
            long long fileSize = [[filemanager attributesOfItemAtPath:filePath error:nil]fileSize];
            
            //3）.加载到文件的大小
            
            size += fileSize;
            
        }
        
        LRRLog(@"allFile -size:%zd",size);

        size += [SDImageCache sharedImageCache].getSize;   //SDImage 缓存
        LRRLog(@"%zd",[SDImageCache sharedImageCache].getSize);
        
        
        LRRLog(@"allFile -size:%zd",size);
        
        if (weakself == nil) return;
        
        NSString *sizeText = nil;
        if (size >= pow(10, 9)) {
            sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
        }else if (size >= pow(10, 6)) {
            sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
        }else if (size >= pow(10, 3)) {
            sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
        }else {
            sizeText = [NSString stringWithFormat:@"%zdB", size];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            weakself.subTitleLabel.text = [NSString stringWithFormat:@"%@",sizeText];
            weakself.accessoryView = nil;
            weakself.iconImageView.hidden = NO;

            weakself.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            [weakself addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakself action:@selector(clearCacheClick)]];
            weakself.userInteractionEnabled = YES;
        });
    });
}

- (void)clearCacheClick
{
    [MBProgressHUD showMessag:@"正在清除缓存···"];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:2.0];
            
            NSFileManager *manager = [NSFileManager defaultManager];

            NSArray *paths = nil;
            
            paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            
            NSMutableString *cachepath = [paths objectAtIndex:0];
            
            NSError *error = nil;
            
            NSArray *fileList = [manager contentsOfDirectoryAtPath:cachepath error:&error];
            
            for (NSString *file in fileList) {
                
                NSString *path = [cachepath stringByAppendingPathComponent:file];
                
                if ([manager isDeletableFileAtPath:path]) {
                    
                    [manager removeItemAtPath:path error:nil];
                    
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self hideHUD];
                // 设置文字
                self.subTitleLabel.text = nil;
                
            });
            
        });
    }];
}

/**
 *  当cell重新显示到屏幕上时, 也会调用一次layoutSubviews
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // cell重新显示的时候, 继续转圈圈
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
