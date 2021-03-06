//
//  HomeRootScrollView.m
//  Elephant
//
//  Created by YZQ on 15/9/9.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "HomeRootScrollView.h"
#import "HomeTopScrollView.h"
#import "ElephantDatabase.h"
#import "ElephantRequest.h"
#import "AccountShare.h"
#import "ResponseManager.h"

#define POSITIONID (int)(scrollView.contentOffset.x/320)

@interface HomeRootScrollView()
@property (nonatomic,strong) NSMutableArray *tableViewArray;
@property (nonatomic,strong) NSMutableArray *analyseData;
@end
    static dispatch_once_t predicate;

@implementation HomeRootScrollView

+ (HomeRootScrollView *)shareInstance {

    static HomeRootScrollView *_instance;
    static dispatch_once_t onceToken;
    CGFloat viewHeight = SCREEN_HEIGHT-NAVIGATIONBAR_HEIGHT-IOS7_STATUS_BAR_HEGHT-TOP_SCROLLVIEW_HEIGHT;
    
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc] initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT+IOS7_STATUS_BAR_HEGHT+TOP_SCROLLVIEW_HEIGHT,SCREEN_WIDTH,viewHeight-TABAR_HEIGHT)];
        _instance.tag = -111;
    });
    
    return _instance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = self;
        self.pagingEnabled = YES;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        contentOffsetX = 0;
    }
    return self;
}



- (void)initWithViews
{
    _tableViewArray = [NSMutableArray arrayWithCapacity:3];
    
//    _datasource = @[@"dd",@"dd",@"ddd",@"dddd"];
    _analyseData = [NSMutableArray array];
    
    CGFloat tableViewHeight = SCREEN_HEIGHT-NAVIGATIONBAR_HEIGHT-IOS7_STATUS_BAR_HEGHT-TOP_SCROLLVIEW_HEIGHT - TABAR_HEIGHT;
    
    
    for (int i = 0; i < [self.viewNames count]; i++) {
     
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0+(SCREEN_WIDTH)*i, 0, SCREEN_WIDTH, tableViewHeight)];
        tableView.tag = i;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView setBackgroundColor:[UIColor redColor]];
        [tableView registerNib:[UINib nibWithNibName:@"HomePostCell" bundle:nil] forCellReuseIdentifier:@"HomePostCell"];
        
        [self addSubview:tableView];
        [_tableViewArray addObject:tableView];
        
    }
     self.contentSize = CGSizeMake((SCREEN_WIDTH)*[self.viewNames count], tableViewHeight);
   

    
    dispatch_once(&predicate, ^{

        [self loadData];
    
    });
}




- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    contentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (contentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调整顶部滑条按钮状态
    [self resetTopScrollViewButton:scrollView];
    
//    [self loadData];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
//    [self loadData];
}


-(void)loadData
{
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
            
            
         NSArray *data  = [ElephantDatabase saveHomePosts:[result valueForKey:HOME_POST_LIST]];
            [_analyseData addObjectsFromArray:data];
            [self.tableViewArray[0] reloadData];
            
            NSArray *v = [ElephantDatabase selectHomePosts:1];
            NSLog(@"---------->%@",v);
            
        }];
        
        
    } fail:^(id error) {
        
    }];
    
    
}



- (void)resetTopScrollViewButton:(UIScrollView *)scrollView
{
    if (scrollView.tag != -111) {
        return;
    }
    
    HomeTopScrollView *top = [HomeTopScrollView shareInstance];
    
    [top setButtonUnSelected];
    
    top.scrollViewSelectedChannelID = POSITIONID+100;
    [top setButtonSelected];
    [top setScrollViewContentX];
}

















#pragma mark uitableview delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_analyseData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *messageCellId = @"HomePostCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:messageCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:messageCellId];
    }

    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        // 处理逻辑
        
        NSLog(@"点击删除");
        
    }];
    
    UITableViewRowAction *cancle = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"标记未读" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        NSLog(@"点击标记");
    }];
    return @[deleteRowAction,cancle];
}










@end
