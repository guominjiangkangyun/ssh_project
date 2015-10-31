//
//  RequestManager.h
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

+(RequestManager *) shareInstance;

-(void) chancelAllRequest;

-(void)requestByPost:(NSString *) url controller:(NSString *)controller action:(NSString *)action params:(NSDictionary *)params success:(void(^)(id result)) success fail:(void(^)(id error)) fail;

@end
