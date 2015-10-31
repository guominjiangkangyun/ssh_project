//
//  SettingViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "SettingViewController.h"
@interface SettingViewController()
{
    NSArray *_title;
}
@end

@implementation SettingViewController


-(void)viewDidLoad{

 self.automaticallyAdjustsScrollViewInsets=NO;
    _title = @[@"修改密码",@"检查新版本",@"关于益像",@"退出登录"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return 3;
            
        default:
            return 1;
    }
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCellId = @"UserSettingCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:strCellId];
    cell.textLabel.text = _title[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
//            PUSH_VC_ANIMATED_MAIN(_MeViewController);
            break;
        case 1:
//            PUSH_VC_ANIMATED_MAIN(MessageViewController);
            break;
        case 2:
//            PUSH_VC_ANIMATED_MAIN(PostViewController);
            break;
        case 3:
//            PUSH_VC_ANIMATED_MAIN(ReplyViewController);
            break;
   
    }
}

@end
