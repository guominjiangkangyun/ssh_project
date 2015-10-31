//
//  DataCheck.m
//  Elephant
//
//  Created by YZQ on 15/9/2.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "DataCheck.h"

@implementation DataCheck
+(BOOL)isNsnullOrnil:(id)data{
 
    
    if ((NSNull *)data == [NSNull null] || data == nil) {
        return YES;
    }

    return NO;

}

+(NSDate *)dateFromString:(NSString *)dateStr{

    NSString *str = [dateStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    
    NSDate *date = [formatter dateFromString:str];
    
    return date;
}
@end
