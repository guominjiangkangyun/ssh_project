//
//  RequestManager.m
//  Elephant
//
//  Created by YZQ on 15/8/26.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "RequestManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "RequestHead.h"
static RequestManager *manager;
static dispatch_once_t predicate;
static AFHTTPRequestOperationManager *queueManager;
@interface RequestManager()

@end
@implementation RequestManager

+(RequestManager *) shareInstance{

 
    _dispatch_once(&predicate, ^{
    
       manager = [[RequestManager alloc]init];
    
    }
                   );
    return manager;
}

-(void) chancelAllRequest{

    if (queueManager) {
        [queueManager.operationQueue cancelAllOperations];
    }

}

-(id)init{

    if ([super init]) {
        queueManager = [AFHTTPRequestOperationManager manager];
        queueManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
    
}


-(void)requestByPost:(NSString *) url controller:(NSString *)controller action:(NSString *)action params:(NSDictionary *)params success:(void(^)(id result)) success fail:(void(^)(id error)) fail{
    NSString *urlPath = [NSString stringWithFormat:@"%@/%@/%@/",url,controller,action];
    NSLog(@"---------------%@",urlPath);
    

    
    //异步请求
        [queueManager POST:urlPath parameters:params success:^(AFHTTPRequestOperation *operation, id result){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"------------%@",result);
                if (success) {
                    success(result);
                }
                
            });
            

            
        } failure:^(AFHTTPRequestOperation *operation, id error){
            
            
            NSLog(@"------------%@",error);
            if (error) {
                fail(error);
            }
            
        }];

}









//+(void)requestByGet{
//
//
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//
//
//    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//        NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//        NSLog(@"Error: %@", error);
//
//    }];
//
//}



@end
