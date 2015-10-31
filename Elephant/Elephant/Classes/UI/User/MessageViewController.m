//
//  MessageViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "MessageViewController.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "UserMessage.h"
#import "UserMessageCell.h"
#import "ElephantRequest.h"
#import "ElephantDatabase.h"
#import "AccountShare.h"
#import "RequestManager.h"
#import "ResponseManager.h"
#import "NSString+ValueChange.h"
#import "UIImageView+WebCache.h"
#import "Account.h"


@interface MessageViewController()<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>
@property (nonatomic ,strong) NSFetchedResultsController *fetchedResultsController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *accountLoginNumber;


@end

@implementation MessageViewController


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self requestData];
}

#pragma mark - tableView data sourse

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *messageCellId = @"UserMessageCell";
    UserMessageCell *cell = (UserMessageCell *)[tableView dequeueReusableCellWithIdentifier:messageCellId];
    if (!cell) {
        cell = [[UserMessageCell alloc] init];
    }
    [self configCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    

}


#pragma mark - NSFetchedResultsController


-(NSFetchedResultsController *)fetchedResultsController{
    
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERMESSAGE;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERMESSAGE];
    NSEntityDescription *messageEntity = [NSEntityDescription entityForName:TABLE_USERMESSAGE inManagedObjectContext:manager.managedObjectContext];
    [fetchRequest setEntity:messageEntity];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"postTime" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:manager.managedObjectContext sectionNameKeyPath:nil cacheName:@"userMsg"];
    _fetchedResultsController.delegate = self;
    
    NSError *error = NULL;
    
    if (![_fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
    return _fetchedResultsController;
}


#pragma mark - Config cell style
-(void)configCell:(UserMessageCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
    UserMessage *obj = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.postTime.text = [NSString StringFromDate:obj.postTime];
    cell.title.text = obj.postTitle;
    cell.content.text = obj.content;
    
    [cell.picture sd_setImageWithURL:[NSURL URLWithString:@"https://www.baidu.com/img/bdlogo.png"]
                    placeholderImage:[UIImage imageNamed:@"red_line_and_shadow"]];
    
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
    [ElephantRequest getReply:params success:^(id result) {
        
        [ResponseManager handleResponse:result success:^(id result) {
            
            [ElephantDatabase clearUserMessage];
            [ElephantDatabase saveUserMessages:result];
            
        }];
        
    } fail:^(id error) {
        
    }];
    
}


#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configCell:[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[RequestManager shareInstance] chancelAllRequest];
    
    
}

@end
