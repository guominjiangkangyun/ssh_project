//
//  HomeViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/25.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeRootScrollView.h"
#import "HomeTopScrollView.h"
#import "AccountShare.h"
#import "ElephantRequest.h"
#import "ElephantDatabase.h"
#import "ResponseManager.h"


@interface HomeViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>{
    UISearchBar *bar;
    UIBarButtonItem *cancleBtn;
    UIView *maskView;
    UITableView *leftTableView;
    UITableView *middleTableView;
    UITableView *rightTableView;
}
- (IBAction)clickSearchButton:(id)sender;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    
    UIImageView *topShadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 104, 320, 5)];
    [topShadowImageView setImage:[UIImage imageNamed:@"top_background_shadow.png"]];
    
    [self.view addSubview:topShadowImageView];
    
    HomeTopScrollView *topScrollView = [HomeTopScrollView shareInstance];
    HomeRootScrollView *rootScrollView = [HomeRootScrollView shareInstance];
    
    topScrollView.titles = @[@"病历讨论", @"医声医事", @"考试交流"];
    rootScrollView.viewNames = @[@"病历讨论", @"医声医事", @"考试交流"];
    
    
    [self.view addSubview:topScrollView];
    [self.view addSubview:rootScrollView];
    
    [topScrollView initHeadButtons];
    [rootScrollView initWithViews];
    
    
}


-(void) requestData{
    
    AccountShare *instance = [AccountShare shareAccountInfo];
    if (instance.sessionId == nil || instance.userId == nil) {
        return;
    }
    
    
    NSDictionary *params = @{KEY_SESSIONID:instance.sessionId,
                             KEY_TYPE : VALUE_ANALYSE,
                             KEY_PAGESIZE:VALUE_PAGESIZE,
                             KEY_PAGEINDEX:@"1"};
    [ElephantRequest getHomePosts:params success:^(id result) {
        
        [ResponseManager handleResponse:result success:^(id result) {
            
            
            [ElephantDatabase saveHomePosts:[result valueForKey:HOME_POST_LIST]];
            
            
        }];
        
    } fail:^(id error) {
        
    }];

}

- (IBAction)clickSearchButton:(id)sender {
    bar = [[UISearchBar alloc] init];
    self.navigationItem.titleView = bar;
    bar.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidshow:) name:UIKeyboardDidShowNotification object:nil];
    
    cancleBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleSearch)];
    self.navigationItem.rightBarButtonItem = cancleBtn;
}
- (void)cancleSearch
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-100, 0, SCREEN_WIDTH-200, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"放射沙龙";
    self.navigationItem.titleView = titleLabel;
     UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_common_search"] style:UIBarButtonItemStylePlain target:self action:@selector(clickSearchButton:)];
    searchBtn.tintColor = [UIColor greenColor];
    self.navigationItem.rightBarButtonItem = searchBtn;

}
- (void)keyboardDidshow:(NSNotification *)info
{
    
}

#pragma mark - searbar delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
    [maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMaskView:)]];
    maskView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:0.5];
    [self.view addSubview:maskView];
    [[UIApplication sharedApplication].keyWindow addSubview:[self popSearchView]];
   
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
     [[[UIApplication sharedApplication].keyWindow.subviews lastObject] removeFromSuperview];
    [maskView removeFromSuperview];
}
- (UITableView *)popSearchView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(bar.frame.origin.x ,64, SCREEN_WIDTH/1.3, SCREEN_HEIGHT/1.8)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor grayColor];
    
    return tableView;
}
- (void)tapMaskView:(UITapGestureRecognizer *)sender
{
    [self cancleSearch];
}
#pragma mark - tableview dalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height/8;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"searchTableView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"test";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didsearchcell");
}
@end
