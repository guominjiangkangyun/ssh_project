//
//  CoreDataManager.h
//  Elephant
//
//  Created by YZQ on 15/8/28.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSString *entityName;

+ (instancetype) shareInstance;

- (void)saveContext;

@end
