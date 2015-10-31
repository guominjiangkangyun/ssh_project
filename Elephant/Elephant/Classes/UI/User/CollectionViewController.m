//
//  CollectionViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "CollectionViewController.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "UserCollection.h"
#import "UserCollectionCell.h"
#import "ElephantRequest.h"
#import "ElephantDatabase.h"
#import "AccountShare.h"
#import "RequestManager.h"
#import "ResponseManager.h"
#import "NSString+ValueChange.h"
#import "UIImageView+WebCache.h"
#import "Account.h"

@interface CollectionViewController ()<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate,MGSwipeTableCellDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellDataArray;

@end

#define TABLEVIEW_FRAME CGRectMake(0, 180,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height-300)

@implementation CollectionViewController

#pragma mark - UITableViewDataSource


-(void)viewDidLoad{

    [super viewDidLoad];
//    [self requestData];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:TABLEVIEW_FRAME style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"我的收藏";
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - TableView delegate

-(NSArray *) createRightButtons: (int) number
{
    NSMutableArray * result = [NSMutableArray array];
    NSString* titles[2] = {@"删除", @"备   注"};
    UIColor * colors[2] = {[UIColor redColor], [UIColor lightGrayColor]};
    for (int i = 0; i < number; ++i)
    {
        MGSwipeButton *button = [MGSwipeButton buttonWithTitle:titles[i] backgroundColor:colors[i]];
        [result addObject:button];
    }
    return result;
}

- (NSMutableArray *)cellDataArray
{
    if (!_cellDataArray) {
        _cellDataArray = [NSMutableArray array];
        
        //
        NSArray *testArray = @[@1,@2,@3,@4,@5,@6];
        [_cellDataArray addObjectsFromArray:testArray];
    }
    return _cellDataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        
        return self.cellDataArray.count;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MGSwipeTableCell * cell;
    static NSString * reuseIdentifier = @"collectionCell";
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    UIImageView *imageView = [UIImageView circleImageWithImageName:@"ic_app_logo" viewFrame:CGRectMake(10, 13, 40, 40)];
    [cell.contentView addSubview:imageView];
    cell.delegate = self;
    cell.rightButtons = [self createRightButtons:2];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    self.tableView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - MGSwapeCell delegate
- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell tappedButtonAtIndex:(NSInteger)index direction:(MGSwipeDirection)direction fromExpansion:(BOOL)fromExpansion
{
    direction = MGSwipeDirectionRightToLeft;
    if (index == 0) {
        //删除
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        [self.cellDataArray removeObjectAtIndex:path.row];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        return NO;
    }else{
        //取消收藏
        NSLog(@"1");
    }
    return YES;
}


#pragma mark - request data

-(void)requestData{
    
    AccountShare *account = [[ElephantDatabase selectAccount] lastObject];
    
    
    if (account.sessionId == nil || account.userId == nil) {
        return;
    }
    
    NSDictionary *params = @{KEY_SESSIONID:account.sessionId,
                             KEY_PAGESIZE:@"20",
                             KEY_PAGEINDEX:@"1"};
        
    [ElephantRequest getCollections:params success:^(id result) {
        
        [ElephantDatabase clearUserCollection];
        [ElephantDatabase saveUserCollections:result];
        
    } fail:^(id error) {
        
    }];
        
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [[RequestManager shareInstance] chancelAllRequest];
    
}

@end
