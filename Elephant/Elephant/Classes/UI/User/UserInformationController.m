//
//  UserInformationController.m
//  Elephant
//
//  Created by shen_h on 15/9/15.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "UserInformationController.h"
#import "AccountDataModel.h"

@interface UserInformationController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) AccountDataModel *account;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *userInfo;
@property (nonatomic, strong) NSArray *userInfoRight;
@property (nonatomic, strong) NSArray *userPrivate;
@property (nonatomic, strong) NSArray *userPrivateRight;
@end

@implementation UserInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";
    
    _account = [AccountDataModel shareInstance];
    
    NSString *gender;
    if (self.account.Gender) {
        gender = @"男";
    }else{
        gender = @"女";
    }
    _userInfo = @[@"头像",@"性别",@"名字",@"医院",@"科室",@"职称"];
    _userInfoRight = @[@"?",
                       gender,[NSString stringWithFormat:@"%.0ld",self.account.Name],
                       self.account.Hospital,self.account.Department,
                       self.account.Title
                       ];
    _userPrivate = @[@"地区",@"个人签名"];
    
    _userPrivateRight = @[self.account.Region,self.account.Signature];
  
    self.view.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
    
//    [self.navigationController.tabBarController.tabBar setHidden:YES];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    

    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:NO];
//    [self.navigationController.tabBarController.tabBar setHidden:NO];
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 15;
    }
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 100;
    }
    return 48;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return self.userInfo.count;
    }
    return self.userPrivate.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"userInformationCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, 12, 130, 20)];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.userInfo[indexPath.row];
        if (indexPath.row == 0) {
            UIImageView *userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-100,20, 60, 60)];
            userIcon.image = [UIImage imageNamed:@"ic_app_logo"];
            [cell addSubview:userIcon];
        }else {
            label.text = self.userInfoRight[indexPath.row];
            [cell addSubview:label];
        }
        return cell;
    }
    label.text = self.userPrivateRight[indexPath.row];
    [cell addSubview:label];
    cell.textLabel.text = self.userPrivate[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self didSectiontoAlertUserIcon];
    }
}
- (void)didSectiontoAlertUserIcon
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选取照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"图库选择" otherButtonTitles:@"拍照上传", nil];
    [sheet showInView:self.view];
}
@end
