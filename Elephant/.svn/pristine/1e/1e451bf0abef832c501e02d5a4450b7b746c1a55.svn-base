//
//  UserViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "UserViewController.h"
#import "@MeViewController.h"
#import "MessageViewController.h"
#import "PostViewController.h"
#import "ReplyViewController.h"
#import "CollectionViewController.h"
#import "SettingViewController.h"
#import "AccountDataModel.h"
#import "UserInformationController.h"



@interface UserViewController() <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_title;
    NSArray *_icon;
    __weak IBOutlet UIButton *_loginBtn;
    
    __weak IBOutlet UILabel *showLoginStaus;
    
    __weak IBOutlet UIView *userInfoView;
    
    __weak IBOutlet UILabel *userIntegral;

    __weak IBOutlet UILabel *userFans;
    
    __weak IBOutlet UILabel *userConcerns;
    
    __weak IBOutlet UIImageView *userIconView;
    
    __weak IBOutlet UILabel *userName;
    
    __weak IBOutlet UIButton *touchToInfo;
}

@end
@implementation UserViewController


-(void)viewDidLoad{

    _title = @[@"@我的",@"我的消息",@"我的帖子",@"我的回复",@"我的收藏",@"设置"];
    _icon = @[@"ic_user_@",@"ic_user_message",@"ic_user_post",@"ic_user_reply",@"ic_user_collection",@"ic_user_setting"];
    
      _loginBtn.layer.cornerRadius = DEFAULT_CORNERRADIUS;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:34.0f/225 green:234.0f/225 blue:202.0f/225 alpha:1.0f];
    
    [touchToInfo setBackgroundColor:[UIColor clearColor]];
    [touchToInfo setHidden:YES];
    
//    [self.navigationController.tabBarController.tabBar setHidden:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLoginStataus:) name:kNotificationUserIsLogin object:nil];


}

- (void)handleLoginStataus:(NSNotification *)info
{
    if (info.userInfo[@"userIsLogin"]) {
        self.navigationController.navigationBarHidden = NO;
        [showLoginStaus removeFromSuperview];
        [_loginBtn removeFromSuperview];
        NSLog(@"%@",NSStringFromCGRect(userInfoView.frame));
        
        AccountDataModel *model = [AccountDataModel shareInstance];
        
        userIconView.layer.masksToBounds = YES;
        userIconView.layer.cornerRadius = userIconView.frame.size.width/2;
        userIconView.image = [UIImage imageNamed:@"ic_app_logo"];
        
        userIntegral.text = [NSString stringWithFormat:@"%.0f",model.Integral];
        userFans.text = [NSString stringWithFormat:@"%.0f",model.Fans];
        userConcerns.text = [NSString stringWithFormat:@"%.0f",model.Concerns];
        userName.text = [NSString stringWithFormat:@"%0.ld",model.Name];
        
        [touchToInfo setHidden:NO];
        [touchToInfo addTarget:self action:@selector(touchToInformationController:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}
- (void)touchToInformationController:(UIButton *)sender
{
    PUSH_VC_ANIMATED_MAIN(UserInformationController);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCellId = @"UserCenterCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:strCellId];
    cell.textLabel.text = _title[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_icon[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            PUSH_VC_ANIMATED_MAIN(_MeViewController);
            break;
        case 1:
            PUSH_VC_ANIMATED_MAIN(MessageViewController);
            break;
        case 2:
            PUSH_VC_ANIMATED_MAIN(PostViewController);
            break;
        case 3:
            PUSH_VC_ANIMATED_MAIN(ReplyViewController);
            break;
            
        case 4:
            PUSH_VC_ANIMATED_MAIN(CollectionViewController);

            break;
        case 5:
            PUSH_VC_ANIMATED_MAIN(SettingViewController);
            break;
     }
 }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [self.navigationController setNavigationBarHidden:YES];

}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:kNotificationUserIsLogin];
}




@end
