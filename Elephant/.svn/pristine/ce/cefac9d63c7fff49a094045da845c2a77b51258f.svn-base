//
//  PostViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

//
//  CollectionViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "PostViewController.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "ElephantRequest.h"
#import "ElephantDatabase.h"
#import "AccountShare.h"
#import "RequestManager.h"
#import "ResponseManager.h"
#import "NSString+ValueChange.h"
#import "UIImageView+WebCache.h"
#import "Account.h"
#import "MailTableCell.h"

@interface MailData : NSObject
@property (nonatomic, strong) NSString * from;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, assign) BOOL read;
@property (nonatomic, assign) BOOL flag;

@end

@implementation MailData
@end

@interface PostViewController()<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate,MGSwipeTableCellDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellDataArray;

@property (nonatomic, strong) NSMutableArray *testArray;

@property (nonatomic, strong) NSMutableArray *heightArray;

@end

#define TABLEVIEW_FRAME CGRectMake(0, 180,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height-300)

@implementation PostViewController

#pragma mark - UITableViewDataSource


-(void)viewDidLoad{
    
    [super viewDidLoad];
    //    [self requestData];
    
    [self.tableView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:233/255.0]];
    
    self.tableView = [[UITableView alloc] initWithFrame:TABLEVIEW_FRAME style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.tableView.estimatedRowHeight = 68;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"我的帖子";
    
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - TableView delegate

- (NSMutableArray *)testArray
{
    if (!_testArray) {
        _testArray = [NSMutableArray array];
        NSArray *arr = @[
                       @"You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out.",
                       @"And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers.",
                       @"Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house",
                       @"No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.",
                       @"In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero",
                       @"If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there.",
                       @"that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.",
                       @"Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows.",
                       @"And most times they're friends, like you and me! I should've known way back when...",
                       @"After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide",
                       @"Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children",
                       ];
        
        [_testArray addObjectsFromArray:arr];

    }
    return _testArray;
}
- (NSMutableArray *)heightArray
{
    if (!_heightArray) {
        _heightArray = [NSMutableArray array];
//        NSArray *array = @[@100,]
    }
    return _heightArray;
}
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"MailCell";
    MailTableCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MailTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.delegate = self;
    
    cell.mailFrom.text = @"asdadd";
    cell.mailSubject.text = @"sdssadsasdasd";
    cell.mailMessage.text = self.testArray[indexPath.row];
    cell.mailTime.text = @"10:31";
    cell.indicatorView.indicatorColor = [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1.0];
    cell.rightButtons = [self createRightButtons:2];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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
        [self.testArray removeObjectAtIndex:path.row];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        return NO;
    }else{
        //备注
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

