//
//  @MeViewController.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "@MeViewController.h"
#import "MessageViewController.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "UserChatMe.h"
#import "UserCollectionCell.h"
#import "ElephantRequest.h"
#import "ElephantDatabase.h"
#import "AccountShare.h"
#import "RequestManager.h"
#import "ResponseManager.h"
#import "NSString+ValueChange.h"
#import "UIImageView+WebCache.h"
#import "Account.h"

@interface _MeViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
@implementation _MeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.indicatorView stopAnimating];
    
    [self reloadData];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }
    
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCHATME;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERCHATME];
    NSEntityDescription *collectionEntity = [NSEntityDescription entityForName:TABLE_USERCHATME inManagedObjectContext:manager.managedObjectContext];
    [fetchRequest setEntity:collectionEntity];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"postTime" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:manager.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    //    _fetchedResultsController.delegate = self;
    
    NSError *error = NULL;
    
    if (![_fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
    return _fetchedResultsController;
    
}
- (void)reloadData
{
    AccountShare *account = [AccountShare shareAccountInfo];
    
    if (account.sessionId == nil || account.userId == nil) {
        return;
    }
    
    NSDictionary *params = @{KEY_SESSIONID:account.sessionId};
    
    [ElephantRequest getChatMe:params success:^(id result) {
        
        NSLog(@">>>>>>>>>>>chatme%@>>>>>>>>>>",result);
        
    } fail:^(id error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"获取服务器数据失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
        
        [alert show];
    }];
}

@end
