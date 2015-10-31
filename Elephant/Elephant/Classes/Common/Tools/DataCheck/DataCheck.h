//
//  DataCheck.h
//  Elephant
//
//  Created by YZQ on 15/9/2.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCheck : NSObject
+(BOOL)isNsnullOrnil:(id)data;
+(NSDate *) dateFromString:(NSString *) dateStr;
@end
