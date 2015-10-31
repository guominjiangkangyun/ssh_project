//
//  AccountShare.h
//  Elephant
//
//  Created by YZQ on 15/8/31.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountShare : NSObject

@property (nonatomic,strong) NSString * sessionId;
@property (nonatomic,strong) NSNumber * userId;

+ (instancetype)shareAccountInfo;

@end
