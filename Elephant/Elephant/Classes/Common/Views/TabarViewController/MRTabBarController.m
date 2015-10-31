//
//  MRTabBarController.m
//  MedicalRecords
//
//  Created by shejun.zhou on 15/7/10.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "MRTabBarController.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/** 选中时的颜色 */
#define SELECTED_COLOR RGBA(1, 164, 164, 1)

@interface MRTabBarController ()

@end

@implementation MRTabBarController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SELECTED_COLOR}
                                             forState:UIControlStateSelected];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0,-60)forBarMetrics:UIBarMetricsDefault];
    
    NSArray * title = @[@"首页",@"通讯录",@"讨论区",@"用户中心"];

    NSArray *imageNameArray = [NSArray arrayWithObjects:@"ic_tabar_home_h",
                               @"ic_tabar_address_h",
                               @"ic_tabar_forum_h", @"ic_tabar_user_h",nil];

    for (int i = 0; i < self.viewControllers.count; i++) {
        UINavigationController *navigationViewController = self.viewControllers[i];

        UITabBarItem *item = self.tabBar.items[i];
        UIImage * selectedImage = [[UIImage imageNamed:[imageNameArray objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *newItem = [[UITabBarItem alloc] initWithTitle:title[i]
                                                              image:item.image
                                                      selectedImage:selectedImage];
        navigationViewController.tabBarItem = newItem;
    }
    self.selectedIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
