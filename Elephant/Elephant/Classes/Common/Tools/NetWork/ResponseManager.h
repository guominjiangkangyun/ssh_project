//
//  ErrorManager.h
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseManager : NSObject
+(NSString *)getMessage:(NSError *) error;
+(void)handleResponse:(id)result success:(void(^)(id data))success;
@end
