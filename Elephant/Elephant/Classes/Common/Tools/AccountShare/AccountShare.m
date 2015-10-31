//
//  AccountShare.m
//  Elephant
//
//  Created by YZQ on 15/8/31.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "AccountShare.h"
#import "ElephantDatabase.h"

static id _instance;
@implementation AccountShare
@synthesize userId = _userId;
@synthesize sessionId = _sessionId;

#pragma mark - singleTon
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)shareAccountInfo{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
        
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (void)setUserId:(NSNumber *)userId
{
    _userId = userId;
}
- (NSNumber *)userId
{
    return _userId;
}
- (void)setSessionId:(NSString *)sessionId
{
    _sessionId = sessionId;
}
- (NSString *)sessionId
{
    return _sessionId;
}
@end
