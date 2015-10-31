//
//  ElephantDatabase.h
//  Elephant
//
//  Created by YZQ on 15/8/28.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface ElephantDatabase : NSObject


//保存用户信息至account.sqlite中

+(BOOL) saveAccountInfo:(NSDictionary *)data;

+(NSArray *) selectAccount;

+(BOOL) isThereExistTheUser:(NSNumber *)userId;

+(BOOL) deleteAccountById:(int)Id;

+(BOOL) updateAccountById:(int)Id account:(Account *)info;


//用户消息

+(BOOL) saveUserMessages:(NSArray *)data;

+(NSArray *) selectUserMessage:(NSUInteger)pageIndex;

+(BOOL)clearUserMessage;

+(BOOL)deleteUserMessage:(NSNumber *)postId;


//我的收藏

+(BOOL) saveUserCollections:(NSArray *)data;

+(NSArray *)selectUserCollection:(NSUInteger)pageIndex;

+(BOOL)clearUserCollection;

+(BOOL)deleteUserCollection:(NSNumber *)postId;

//我的帖子

+(NSArray *) saveHomePosts:(NSArray *)data;

+(NSArray *) selectHomePosts:(NSUInteger)pageIndex;

//我的消息

+(BOOL)saveUserChatMeDictAttribute:(NSDictionary *)dict;// Char

+(NSArray *)selectUserChatMeDictAttribute:(NSInteger)pageIndex;

+(BOOL)clearUserChatMeDictAttribute;

+(BOOL)saveUserChatMe:(NSArray *)data;//data 嵌套字典

+(BOOL)clearUserChatMe;

+(BOOL)deleteUserChatMe:(NSNumber *)postId;

@end
