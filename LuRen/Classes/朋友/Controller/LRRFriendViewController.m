//
//  LRRFriendViewController.m
//  LuRen
//
//  Created by Ding on 2018/1/17.
//  Copyright © 2018年 supconit. All rights reserved.
//

#import "LRRFriendViewController.h"
#import "LRRPrivateMessageViewController.h"
@interface LRRFriendViewController ()

@end

@implementation LRRFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavi];
    self.navigationItem.title = @"对话列表";
    self.isShowNetworkIndicatorView = YES;
    self.conversationListTableView.backgroundColor = LRRViewBackgroundColor;
    self.conversationListTableView.tableFooterView = [UIView new];
    self.emptyConversationView = [UIView new];
    [self refreshConversationTableViewIfNeeded];
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
}

- (void)addFriendAction
{
    LRRLog(@"加朋友");
}

#pragma mark - 添加导航栏按钮
- (void)addNavi
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_jia" highImage:@"icon_jia" target:self action:@selector(addFriendAction)];
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    LRRPrivateMessageViewController *conversationVC = [[LRRPrivateMessageViewController alloc]init];
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
    
    dispatch_after(
                   dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                       [self refreshConversationTableViewIfNeeded];
                   });
}

//左滑删除
- (void)rcConversationListTableView:(UITableView *)tableView
                 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                  forRowAtIndexPath:(NSIndexPath *)indexPath {
    //可以从数据库删除数据
    RCConversationModel *model = self.conversationListDataSource[indexPath.row];
    [[RCIMClient sharedRCIMClient] removeConversation:ConversationType_PRIVATE
                                             targetId:model.targetId];
    [self.conversationListDataSource removeObjectAtIndex:indexPath.row];
    [self.conversationListTableView reloadData];
}

//高度
- (CGFloat)rcConversationListTableView:(UITableView *)tableView
               heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 67.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    LRRLogFunc;
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
