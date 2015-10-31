//
//  ElephantDatabase.m
//  Elephant
//
//  Created by YZQ on 15/8/28.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "ElephantDatabase.h"
#import "Account.h"
#import "CoreDataManager.h"
#import "UserMessage.h"
#import "UserCollection.h"
#import "HomePost.h"
#import "DataCheck.h"
#import "AccountShare.h"
#import "UserChatMe.h"
#import "UserChatMeDictAttribut.h"

@implementation ElephantDatabase


#pragma mark user infomation manager

+(BOOL) saveAccountInfo:(NSDictionary *)data{
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_ACCOUNT;
    
    Account *entry = [NSEntityDescription insertNewObjectForEntityForName:TABLE_ACCOUNT inManagedObjectContext:manager.managedObjectContext];
    
    id title = [data valueForKey:USER_TITLE];
    [DataCheck isNsnullOrnil:title] ? nil : [entry setTitle:title];
    
    id signatrue = [data valueForKey:USER_SIGNATURE];
    [DataCheck isNsnullOrnil:signatrue] ? nil : [entry setSignature:signatrue];
    
    id sessionId = [data valueForKey:USER_SESSIONID];
    [DataCheck isNsnullOrnil:sessionId] ? nil : [entry setSessionId:sessionId];
    
    id region = [data valueForKey:USER_REGION];
    [DataCheck isNsnullOrnil:region] ? nil : [entry setRegion:region];
    
    id integral = [data valueForKey:USER_INTEGRAL];
    [DataCheck isNsnullOrnil:integral] ? nil : [entry setIntegral:integral];
    
    id userName = [data valueForKey:USER_NAME];
    [DataCheck isNsnullOrnil:userName] ? nil : [entry setName:userName];
    
    id introduce = [data valueForKey:USER_INTRODUCE];
    [DataCheck isNsnullOrnil:introduce] ? nil : [entry setIntroduce:introduce];
    
    id iconId = [data valueForKey:USER_ICONID];
    [DataCheck isNsnullOrnil:iconId] ? nil : [entry setIconId:[NSNumber numberWithInt:[iconId intValue] ]];
    
    id hospital = [data valueForKey:USER_HOSPITAL];
    [DataCheck isNsnullOrnil:hospital] ? nil : [entry setHospital:hospital];
    
    id gender = [data valueForKey:USER_GENDER];
    [DataCheck isNsnullOrnil:gender] ? nil : [entry setGender:gender];
    
    id department = [data valueForKey:USER_DEPARTMENT];
    [DataCheck isNsnullOrnil:department] ? nil : [entry setDepartment:department];
    
    id fans = [data valueForKey:USER_FANS];
    [DataCheck isNsnullOrnil:fans] ? nil : [entry setFans:fans];
    
    id userId = [data valueForKey:USER_ID];
    [DataCheck isNsnullOrnil:userId] ? nil : [entry setUserId:userId];
    
    NSError *error;
    
    
    BOOL isSaveSuccess = [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        
    }else {
        
        AccountShare *accountLogin = [AccountShare shareAccountInfo];
        accountLogin.sessionId = sessionId;
        accountLogin.userId = userId;
        
        NSLog(@"Save successful!");
        
    }
    return isSaveSuccess;
    
    
    
    
}


+(BOOL) updateAccountById:(int)Id account:(Account *)info{
    
    BOOL isUpdate = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    NSError *error = nil;
    isUpdate = [manager.managedObjectContext save:&error];
    if (error) {
        
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    return isUpdate;
    
    
}

//返回所有用户
+(NSArray *) selectAccount{
    NSMutableArray *accountsArray = [NSMutableArray array];
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_ACCOUNT;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_ACCOUNT];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_ACCOUNT inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResult = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult.count == 0) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        return nil;
    }
    for (Account *a in mutableFetchResult) {
        [accountsArray addObject:a];
    }
    
    return accountsArray;
}

//判断本地列表是否存在此用户
+(BOOL)isThereExistTheUser:(NSNumber *)userId
{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    
    manager.entityName = TABLE_ACCOUNT;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:TABLE_ACCOUNT];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId = %@",userId];
    
    request.predicate = predicate;
    
    NSError *error = nil;
    
    NSArray *accounts = [manager.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
    
    [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
    
    if (accounts.count != 0) {
        return YES;
    }
    
    return NO;
    
}

//在本地内存中删除指定用户信息

+(BOOL) deleteAccountById:(int)Id{
    
    BOOL isDelete = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_ACCOUNT;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_ACCOUNT inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Id=%i",Id];
    [request setPredicate:predicate];
    NSError *error = nil;
    NSManagedObject *obj = [[manager.managedObjectContext executeFetchRequest:request error:&error] lastObject];
    if (obj) {
        [manager.managedObjectContext deleteObject:obj];
        isDelete =  [manager.managedObjectContext save:&error];
        
        
    }
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
    
    return isDelete;
    
    
}


#pragma mark user message list manager

+(BOOL) saveUserMessages:(NSArray *)data{
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    
    manager.entityName = TABLE_USERMESSAGE;
    
    NSUInteger length = [data count];
    
    NSMutableArray *arrayData = [[NSMutableArray alloc] initWithCapacity:length];
    
    for (int i = 0; i<[data count]; i++) {
        
        
        NSDictionary *value = data[i];
        
        UserMessage *entry = (UserMessage *)[NSEntityDescription insertNewObjectForEntityForName:TABLE_USERMESSAGE inManagedObjectContext:manager.managedObjectContext];
        
        id postId = [value valueForKey:USER_MESSAGE_POSTID];
        [DataCheck isNsnullOrnil: postId] ? nil : [entry setPostId:postId];
        
        id postTitle = [value valueForKey:USER_MESSAGE_POSTTITLE];
        [DataCheck isNsnullOrnil:postTitle] ? nil : [entry setPostTitle:postTitle];
        
        id postTime = [value valueForKey:USER_MESSAGE_POSTTIME];
        [DataCheck isNsnullOrnil:postTime] ? nil : [entry setPostTime:[DataCheck dateFromString:postTime]];
        
        id replyId = [value valueForKey:USER_MESSAGE_REPLYID];
        [DataCheck isNsnullOrnil:replyId] ? nil : [entry setReplyId:replyId];
        
        id sender = [value valueForKey:USER_MESSAGE_SENDER];
        [DataCheck isNsnullOrnil:sender] ? nil : [entry setSender:sender];
        
        id sendId = [value valueForKey:USER_MESSAGE_SENDERID];
        [DataCheck isNsnullOrnil:sendId] ? nil : [entry setSenderId:[NSNumber numberWithInt:[sendId intValue]]];
        
        id supports = [value valueForKey:USER_MESSGAE_SUPPORTS];
        [DataCheck isNsnullOrnil:supports] ? nil : [entry setSupports:supports];
        
        id isSupport = [value valueForKey:USER_MESSAGE_ISSUPPORT];
        [DataCheck isNsnullOrnil:isSupport] ? nil : [entry setIsCourse:isSupport];
        
        id isCourse = [value valueForKey:USER_MESSAGE_ISCOURSE];
        [DataCheck isNsnullOrnil:isCourse] ? nil : [entry setIsCourse:isCourse];
        
        id isCollection = [value valueForKey:USER_MESSGAE_ISCOLLECTION];
        [DataCheck isNsnullOrnil:isCollection] ? nil : [entry setIsCollection:isCollection];
        
        id iconId = [value valueForKey:USER_MESSAGE_ICONID];
        [DataCheck isNsnullOrnil:iconId] ? nil : [entry setIconId:iconId];
        
        id content = [value valueForKey:USER_MESSGAE_CONTENT];
        [DataCheck isNsnullOrnil:content] ? nil : [entry setContent:content];
        
        [arrayData addObject:entry];
        
    }
    
    NSError *error;
    
    BOOL isSaveSuccess = [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        
    }else {
        
        NSLog(@"Save successful!");
        
    }
    return isSaveSuccess;
    
}






+(NSArray *) selectUserMessage:(NSUInteger)pageIndex{
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERMESSAGE;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERMESSAGE];
    [request setFetchLimit:QUERRY_PAGE_SIZE];
    [request setFetchOffset:pageIndex*QUERRY_PAGE_SIZE];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERMESSAGE inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"postTime"ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    
    NSError *error = nil;
    
    NSMutableArray *mutableFetchResult = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    return mutableFetchResult[0];
    
}

+(BOOL)clearUserMessage{
    
    BOOL isDelete = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERMESSAGE;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERMESSAGE];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERMESSAGE inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    
    NSError *error = nil;
    NSMutableArray *obj = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    for (NSManagedObject *o in obj) {
        
        [manager.managedObjectContext deleteObject:o];
        isDelete &=  [manager.managedObjectContext save:&error];
        
    }
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Clear successful!");
    }
    
    return isDelete;
    
}

+(BOOL)deleteUserMessage:(NSNumber *)postId
{
    BOOL isDelete = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERMESSAGE;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERMESSAGE inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"postId = %@",postId];
    [request setPredicate:predicate];
    NSError *error = nil;
    
    isDelete = [manager.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
    
    return isDelete;
}

#pragma mark user collection list manager


+(BOOL) saveUserCollections:(NSArray *)data
{
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    
    manager.entityName = TABLE_USERCOLLECTION;
    
    NSUInteger length = [data count];
    
    NSLog(@"%zd",length);
    
    NSMutableArray *arrayData = [[NSMutableArray alloc] initWithCapacity:length];
    NSLog(@"%zd",arrayData.count);
    
    for (int i = 0; i< [data count]; i++) {
        
        
        NSDictionary *value = data[i];
        
        UserCollection *entry = (UserCollection *)[NSEntityDescription insertNewObjectForEntityForName:TABLE_USERCOLLECTION inManagedObjectContext:manager.managedObjectContext];
        
        id author = [value valueForKey:USER_COLLECTION_AUTHOR];
        [DataCheck isNsnullOrnil: author] ? nil : [entry setAuthor:author];
        
        id favPostDetailUrl = [value valueForKey:USER_COLLECTION_FAVPOSTDETAIURL];
        [DataCheck isNsnullOrnil:favPostDetailUrl] ? nil : [entry setFavPostDetailUrl:favPostDetailUrl];
        
        id iconId = [value valueForKey:USER_COLLECTION_ICONID];
        [DataCheck isNsnullOrnil:iconId] ? nil : [entry setIconId:iconId];
        
        id isCourse = [value valueForKey:USER_COLLECTION_ISCOURSE];
        [DataCheck isNsnullOrnil:isCourse] ? nil : [entry setIsCourse:isCourse];
        
        id postTime = [value valueForKey:USER_COLLECTION_POSTTIME];
        [DataCheck isNsnullOrnil:postTime] ? nil : [entry setPostTime:[DataCheck dateFromString:postTime]];
        
        id postId = [value valueForKey:USER_COLLECTION_POSTID];
        [DataCheck isNsnullOrnil:postId] ? nil : [entry setPostId:postId];
        
        id isExpert = [value valueForKey:USER_COLLECTON_ISEXPERT];
        [DataCheck isNsnullOrnil:isExpert] ? nil : [entry setIsExpert:isExpert];
        
        id isExtractive = [value valueForKey:USER_COLLECTION_ISEXTRACTIVE];
        [DataCheck isNsnullOrnil:isExtractive] ? nil : [entry setIsExtractive:isExtractive];
        
        id isIncludePic = [value valueForKey:USER_COLLECTION_ISINCLUDEPIC];
        [DataCheck isNsnullOrnil:isIncludePic] ? nil : [entry setIsIncludePic:isIncludePic];
        
        id isTop = [value valueForKey:USER_COLLECTION_ISTOP];
        [DataCheck isNsnullOrnil:isTop] ? nil : [entry setIsTop:isTop];
        
        id isHot = [value valueForKey:USER_COLLECTION_ISHOT];
        [DataCheck isNsnullOrnil:isHot] ? nil : [entry setIsHot:isHot];
        
        id replys = [value valueForKey:USER_COLLECTION_REPLYS];
        [DataCheck isNsnullOrnil:replys] ? nil : [entry setReplys:replys];
        
        id supports = [value valueForKey:USER_COLLECTION_SUPPORTS];
        [DataCheck isNsnullOrnil:supports] ? nil : [entry setSupports:supports];
        
        id title = [value valueForKey:USER_COLLECTION_TITLE];
        [DataCheck isNsnullOrnil:title] ? nil : [entry setTitle:title];
        
        
        [arrayData addObject:entry];
        
    }
    
    NSError *error;
    
    BOOL isSaveSuccess = [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        
    }else {
        
        NSLog(@"Save successful!");
        
    }
    return isSaveSuccess;
    
}

+(NSArray *)selectUserCollection:(NSUInteger)pageIndex
{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCOLLECTION;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERCOLLECTION];
    [request setFetchLimit:QUERRY_PAGE_SIZE];
    [request setFetchOffset:pageIndex*QUERRY_PAGE_SIZE];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERCOLLECTION inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"postTime"ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    
    NSError *error = nil;
    
    NSMutableArray *mutableFetchResult = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    return mutableFetchResult[0];
    
}

+(BOOL)clearUserCollection
{
    
    BOOL isDelete = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCOLLECTION;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERCOLLECTION];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERCOLLECTION inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    
    NSError *error = nil;
    NSMutableArray *obj = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    for (NSManagedObject *o in obj) {
        
        [manager.managedObjectContext deleteObject:o];
        isDelete &=  [manager.managedObjectContext save:&error];
        
    }
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Clear successful!");
    }
    
    return isDelete;
    
}
+(BOOL)deleteUserCollection:(NSNumber *)postId
{
    BOOL isDelete = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCOLLECTION;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERCOLLECTION inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"postId = %@",postId];
    [request setPredicate:predicate];
    NSError *error = nil;
    
    isDelete = [manager.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
    
    return isDelete;
}
#pragma mark user chatme list manager

+ (BOOL)saveUserChatMeDictAttribute:(NSDictionary *)dict
{
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCHATME_DICTATR;
    UserChatMeDictAttribut *entity = [NSEntityDescription insertNewObjectForEntityForName:TABLE_USERCHATME_DICTATR inManagedObjectContext:manager.managedObjectContext];
    
    id content = [dict objectForKey:USER_CHATME_DICTATR_CONTENT];
    [DataCheck isNsnullOrnil:content] ? nil : [entity setContent:content];
    
    id iconId = [dict objectForKey:USER_CHATME_DICTART_ICONID];
    [DataCheck isNsnullOrnil:iconId] ? nil : [entity setIconId:iconId];
    
    id postTime = [dict objectForKey:USER_CHATME_DICTART_POSTTIME];
    [DataCheck isNsnullOrnil:postTime] ? nil : [entity setPostTime:postTime];
    id sendId = [dict objectForKey:USER_CHATME_DICTART_SENDID];
    [DataCheck isNsnullOrnil:sendId] ? nil : [entity setSendId:sendId];
    
    id sender = [dict objectForKey:USER_CHATME_DICTART_SENDER];
    [DataCheck isNsnullOrnil:sender] ? nil : [entity setSender:sender];
    
    id receiver = [dict objectForKey:USER_CHATME_DICTART_RECEIVE];
    [DataCheck isNsnullOrnil:receiver] ? nil : [entity setReceiver:receiver];
    NSError *error = nil;
    
    [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        
        NSLog(@"Save successful!");
        
    }
    
    return dataDict;
    
}
+(NSArray *)selectUserChatMeDictAttribute:(NSInteger)pageIndex
{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCHATME_DICTATR;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERCHATME_DICTATR];
    [request setFetchLimit:QUERRY_PAGE_SIZE];
    [request setFetchOffset:pageIndex*QUERRY_PAGE_SIZE];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERCHATME_DICTATR inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"postTime"ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    
    NSError *error = nil;
    
    NSMutableArray *mutableFetchResult = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    return mutableFetchResult[0];
}

+(BOOL)clearUserChatMeDictAttribute
{
    BOOL isDelete = NO;
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_USERCHATME_DICTATR;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERCHATME_DICTATR];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERCHATME_DICTATR inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    
    NSError *error = nil;
    NSMutableArray *obj = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    for (NSManagedObject *o in obj) {
        
        [manager.managedObjectContext deleteObject:o];
        isDelete &=  [manager.managedObjectContext save:&error];
        
    }
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Clear successful!");
    }
    
    return isDelete;

}

+(BOOL)saveUserChatMe:(NSArray *)data
{
    BOOL isSave;
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    
    manager.entityName = TABLE_USERCHATME;
    
    NSUInteger length = [data count];
    
    NSLog(@"%zd",length);
    
    NSMutableArray *arrayData = [[NSMutableArray alloc] initWithCapacity:length];
    NSLog(@"%zd",arrayData.count);
    
    for (int i = 0; i< [data count]; i++) {

        NSDictionary *value = data[i];
        
        UserChatMe *entry = (UserChatMe *)[NSEntityDescription insertNewObjectForEntityForName:TABLE_USERCHATME inManagedObjectContext:manager.managedObjectContext];
        
        id chart = [value valueForKey:USER_CHATME_CHART];
        [DataCheck isNsnullOrnil: chart] ? nil : [entry setChart:chart];
        
        id notReadNum = [value valueForKey:USER_CHATME_NOTREADNUM];
        [DataCheck isNsnullOrnil:notReadNum] ? nil : [entry setNotReadNum:notReadNum];
        
        [arrayData addObject:entry];
        
    }
    
    NSError *error;
    
    isSave = [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        
    }else {
        
        NSLog(@"Save successful!");
        
    }
    
    return isSave;
}

+(BOOL)clearUserChatMe
{
    BOOL isDelete = NO;
    isDelete = [self clearUserChatMeDictAttribute];
    if (isDelete) {
        CoreDataManager *manager = [CoreDataManager shareInstance];
        manager.entityName = TABLE_USERCHATME;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_USERCHATME];
        NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_USERCHATME inManagedObjectContext:manager.managedObjectContext];
        [request setEntity:entity];
                
        NSError *error = nil;
        NSMutableArray *obj = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
        
        for (NSManagedObject *o in obj) {
            
            [manager.managedObjectContext deleteObject:o];
            isDelete &=  [manager.managedObjectContext save:&error];
            
        }
        if (error) {
            NSLog(@"Error: %@,%@",error,[error userInfo]);
        }else {
            NSLog(@"Clear successful!");
        }

    }
    return isDelete;

}

+(BOOL)deleteUserChatMe:(NSNumber *)postId

{
    BOOL isDelete;
    
    
    return isDelete;
}

#pragma mark home post list manager


+(NSArray *)saveHomePosts:(NSArray *)data{
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    
    manager.entityName = TABLE_HOMEPOST;
    
    NSUInteger length = [data count];
    
    NSMutableArray *arrayData = [[NSMutableArray alloc] initWithCapacity:length];
    
    for (int i = 0; i<[data count]; i++) {
        
        NSDictionary *value = data[i];
        
        HomePost *entry = (HomePost *)[NSEntityDescription insertNewObjectForEntityForName:TABLE_HOMEPOST inManagedObjectContext:manager.managedObjectContext];
        
        id postId = [value valueForKey:HOME_POST_ID];
        [DataCheck isNsnullOrnil:postId] ? nil : [entry setId:[NSNumber numberWithInt:[postId intValue]]];
        
        id title = [value valueForKey:HOME_POST_TITLE];
        [DataCheck isNsnullOrnil:title] ? nil : [entry setTitle:title];
        
        id authordId = [value valueForKey:HOME_POST_AUTHORID];
        [DataCheck isNsnullOrnil:authordId] ? nil : [entry setAuthorId:[NSNumber numberWithInt:[authordId intValue]]];
        
        id authorName = [value valueForKey:HOME_POST_AUTHORNAME];
        [DataCheck isNsnullOrnil:authorName] ? nil : [entry setAuthorName:authorName];
        
        id isExpertRecommand = [value valueForKey:HOME_POST_ISRECOMMAND];
        [DataCheck isNsnullOrnil:isExpertRecommand] ? nil : [entry setIsExpertRecommand:[NSNumber numberWithBool:isExpertRecommand]];
        
        id isCollection = [value valueForKey:HOME_POST_ISCOLLECTION];
        [DataCheck isNsnullOrnil:isCollection] ? nil : [entry setIsCollection:[NSNumber numberWithBool:isCollection]];
        
        id favCnt = [value valueForKey:HOME_POST_FAVCNT];
        [DataCheck isNsnullOrnil:favCnt] ? nil : [entry setFavCnt:[NSNumber numberWithInt:[favCnt intValue]]];
        
        id priaseCnt = [value valueForKey:HOME_POST_PRIASECNT];
        [DataCheck isNsnullOrnil:priaseCnt] ? nil : [entry setPriaseCnt:[NSNumber numberWithInt:[priaseCnt intValue]]];
        
        id repleCnt = [value valueForKey:HOME_POST_REPLECNT];
        [DataCheck isNsnullOrnil:repleCnt] ? nil : [entry setRepleCnt:[NSNumber numberWithInt:[repleCnt intValue]]];
        
        id postTime = [value valueForKey:HOME_POST_POSTTIME];
        [DataCheck isNsnullOrnil:postTime] ? nil : [entry setPostTime:[DataCheck dateFromString:postTime]];
        
        id imgId = [value valueForKey:HOME_POST_IMGID];
        [DataCheck isNsnullOrnil:imgId] ? nil : [entry setImgId:[NSNumber numberWithInt:imgId]];
        
        id isHot = [value valueForKey:HOME_POST_ISHOT];
        [DataCheck isNsnullOrnil:isHot] ? nil : [entry setIsHot:[NSNumber numberWithBool:isHot]];
        
        id isExtractive = [value valueForKey:HOME_POST_ISEXTRACTIVE];
        [DataCheck isNsnullOrnil:isExtractive] ? nil : [entry setIsExtractive:[NSNumber numberWithBool:isExtractive]];
        
        id isTop = [value valueForKey:HOME_POST_ISTOP];
        [DataCheck isNsnullOrnil:isTop] ? nil : [entry setIsTop:[NSNumber numberWithBool:isTop]];
        
        id isIncludePic = [value valueForKey:HOME_POST_ISINCLUDEPIC];
        [DataCheck isNsnullOrnil:isIncludePic] ? nil : [entry setIsIncludePic:[NSNumber numberWithBool:isIncludePic]];
        
        id isCourse = [value valueForKey:HOME_POST_ISCOURSE];
        [DataCheck isNsnullOrnil:isCourse] ? nil : [entry setIsCourse:[NSNumber numberWithBool:isCourse]];
        
        [arrayData addObject:entry];
        
        
    }
    
    NSError *error;
    
    BOOL isSaveSuccess = [manager.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        
    }else {
        
        NSLog(@"Save successful!");
        
    }
    return arrayData;
    
}




+(NSArray *) selectHomePosts:(NSUInteger)pageIndex{
    
    CoreDataManager *manager = [CoreDataManager shareInstance];
    manager.entityName = TABLE_HOMEPOST;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:TABLE_HOMEPOST];
    [request setFetchLimit:QUERRY_PAGE_SIZE];
    [request setFetchOffset:pageIndex*QUERRY_PAGE_SIZE];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_HOMEPOST inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"postTime"ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    
    NSError *error = nil;
    
    NSMutableArray *mutableFetchResult = [[manager.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    //    return mutableFetchResult[0];
    return mutableFetchResult;
    
}















@end
