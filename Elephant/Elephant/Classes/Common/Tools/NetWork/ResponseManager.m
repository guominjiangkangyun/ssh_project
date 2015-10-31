//
//  ErrorManager.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "ResponseManager.h"
#import "AFNetworking.h"
@implementation ResponseManager
+(NSString *)getMessage:(NSError *) error{

    NSString *message = @"请求网络失败";
    switch (error.code) {
        case 404:
            
            break;
            
            
        case -1001:
        
            message = @"请求超时";
            break;
            
        case -1004:
            message = @"连接服务器失败";

            break;
            
        default:
            break;
    }
    
    return message;



}


+(void)handleResponse:(id)result success:(void(^)(id data)) success{

    id flag = [result valueForKey:COMMON_ISSUCCESS];
    if ([flag isEqualToNumber:[NSNumber numberWithInt:1]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            success([result valueForKey:COMMON_RESULT]);
            
        });

    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            
 
            NSString *msg = [result valueForKey:COMMON_ERRORMSG];
            
            NSLog(@"------->%@",msg);
            
        });

    
    }
    
 
    
 

}



@end
