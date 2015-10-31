//
//  ElephantRequest.h
//  Elephant
//
//  Created by YZQ on 15/8/27.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElephantRequest : NSObject

+(void)loginRequest:(NSDictionary *)param success:(void (^)(id result)) success fail:(void (^)(id error)) fail;

+(void)logoutRequest:(NSDictionary *)param success:(void (^)(id result)) success fail:(void (^)(id error)) fail;

+(void)getChatMe:(NSDictionary *)param success:(void (^)(id result)) success  fail:(void(^)(id error)) fail;

+(void)getReply:(NSDictionary *)param success:(void (^)(id result)) success  fail:(void(^)(id error)) fail;

+(void)getCollections:(NSDictionary *)param success:(void (^)(id result)) success fail:(void(^)(id error)) fail;

//我的帖子

+(void)getHomePosts:(NSDictionary *)param success:(void(^)(id result)) success fail:(void(^)(id error)) fail;


@end
