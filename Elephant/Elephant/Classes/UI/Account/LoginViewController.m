//
//  LoginViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/27.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "LoginViewController.h"
#import "ElephantRequest.h"
#import "ResponseManager.h"
#import "RequestManager.h"
#import "ElephantDatabase.h"
#import "AccountShare.h"
#import "AccountDataModel.h"

@interface LoginViewController()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation LoginViewController{
    UIActivityIndicatorView *indicator;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.loginBtn.layer.cornerRadius = DEFAULT_CORNERRADIUS;
    self.account.text = @"13544444444";
    self.password.text = @"123123";
    
    indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, SCREEN_HEIGHT/2-30, 60, 60)];
    
    [[ElephantCheckNetWork defaultNetWork] addCheckNetWorkObserver:self selector:@selector(runTimeCheckNetWorkWhenChanged:)];
}
- (void)runTimeCheckNetWorkWhenChanged:(NSNotification *)info
{
    [[ElephantCheckNetWork defaultNetWork] reachabilityNetWorkChanged:info];
}

- (IBAction)loginBtn_click:(id)sender {
    
    
    [indicator startAnimating];
    
    NSDictionary *params = @{@"userPwd":self.password.text,@"accountId":self.account.text};

    [ElephantRequest loginRequest:params success:^(id result){
        
        [ResponseManager handleResponse:result success:^(id data){
    
            if ([self navigationController]) {
                
                NSDictionary *accountInfo       =
                
                @{
                  USER_CONCERNS : [data valueForKey:USER_CONCERNS],
                  USER_DEPARTMENT:[data valueForKey:USER_DEPARTMENT],
                  USER_FANS:[data valueForKey:USER_FANS],
                  USER_GENDER:[data valueForKey:USER_GENDER],
                  USER_HOSPITAL:[data valueForKey:USER_HOSPITAL],
                  USER_ICONID:[data valueForKey:USER_ICONID],
                  USER_INTEGRAL:[data valueForKey:USER_INTEGRAL],
                  USER_INTRODUCE:[data valueForKey:USER_INTRODUCE],
                  USER_NAME:[data valueForKey:USER_NAME],
                  USER_REGION:[data valueForKey:USER_REGION],
                  USER_SIGNATURE:[data valueForKey:USER_SIGNATURE],
                  USER_TITLE:[data valueForKey:USER_TITLE],
                  USER_ID:[data valueForKey:USER_ID],
                  USER_SESSIONID:[data valueForKey:USER_SESSIONID]
                  };
    
                [ElephantDatabase saveAccountInfo:accountInfo];
                AccountDataModel *accountModel = [AccountDataModel sharedAccountDataWithDictionary:data];
                NSLog(@">>>>>>>>%@>>>>>>>account:%zd",data,accountModel.Fans);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [sender setEnabled:YES];
                    [indicator stopAnimating];
                    _isLogin = YES;
                    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUserIsLogin object:self userInfo:@{@"userIsLogin":@1}];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                });
                
            }
        }];
    } fail:^(id error){
        NSString *msg = [ResponseManager getMessage:error];
        NSLog(@"---->%@",msg);
        
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}

@end
