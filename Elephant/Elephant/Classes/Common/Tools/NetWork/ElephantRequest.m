//
//  ElephantRequest.m
//  Elephant
//
//  Created by YZQ on 15/8/27.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "ElephantRequest.h"
#import "RequestManager.h"
#import "RequestHead.h"

@implementation ElephantRequest

+(void)loginRequest:(NSDictionary *)param success:(void (^)(id result)) success fail:(void (^)(id error)) fail{
    
    [[RequestManager shareInstance] requestByPost:BaseUrl controller:CONTROLLER_ACCOUNT action:ACTION_LOGIN params:param success:success fail:fail];
    
    
}

+(void)logoutRequest:(NSDictionary *)param success:(void (^)(id result)) success fail:(void (^)(id error)) fail{
    
    
}

+(void)getChatMe:(NSDictionary *)param success:(void (^)(id result)) success  fail:(void(^)(id error)) fail{
    
    [[RequestManager shareInstance] requestByPost:BaseUrl controller:CONTROLLER_MESSAGE action:ACTION_GETCHARLIST params:param success:success fail:fail];
    
}

+(void)getReply:(NSDictionary *)param success:(void (^)(id result)) success  fail:(void(^)(id error)) fail{
    
    [[RequestManager shareInstance] requestByPost:BaseUrl controller:CONTROLLER_MESSAGE action:ACTION_GETREPLYLIST params:param success:success fail:fail];
    
}

+(void)getCollections:(NSDictionary *)param success:(void (^)(id result)) success fail:(void(^)(id error)) fail
{
    [[RequestManager shareInstance] requestByPost:BaseUrl controller:CONTROLLER_COLLECTION action:ACTION_GETCASEANALYSISPOSTS params:param success:success fail:fail];
}



+(void)getPosts:(NSDictionary *)param success:(void (^)(id result)) success fail:(void(^)(id error)) fail
{
    [[RequestManager shareInstance] requestByPost:BaseUrl controller:CONTROLLER_POST action:ACTION_GETFAVPOSTS params:param success:success fail:fail];
}

+(void)getHomePosts:(NSDictionary *)param success:(void (^)(id))success fail:(void (^)(id))fail{
    
    
    [[RequestManager shareInstance] requestByPost:BaseUrl controller:CONTROLLER_POST action:ACTION_GETCASEANALYSISPOSTS params:param success:success fail:fail];
    
}








@end
