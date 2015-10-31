//
//  AccountDataModel.m
//  Elephant
//
//  Created by shen_h on 15/9/14.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "AccountDataModel.h"

@implementation AccountDataModel
static id _instance;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)shareInstance{
    
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

- (instancetype)initWithAccountDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
       [self setValue:dict[@"Concerns"] forKey:@"Concerns"];
        [self setValue:dict[@"Department"] forKey:@"Department"];
        [self setValue:dict[@"Fans"] forKey:@"Fans"];
        [self setValue:dict[@"Gender"] forKey:@"Gender"];
        [self setValue:dict[@"Hospital"] forKey:@"Hospital"];
        [self setValue:dict[@"IconId"] forKey:@"IconId"];
        [self setValue:dict[@"Id"] forKey:@"Id"];
        [self setValue:dict[@"Name"] forKey:@"Name"];
        [self setValue:dict[@"Region"] forKey:@"Region"];
        [self setValue:dict[@"Signature"] forKey:@"Signature"];
        [self setValue:dict[@"Title"] forKey:@"Title"];
        [self setValue:dict[@"UserId"] forKey:@"UserId"];

    }
    return self;
}

+ (instancetype)sharedAccountDataWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithAccountDictionary:dict];
}


@end
