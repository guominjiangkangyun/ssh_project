//
//  UserCollectionDataModel.m
//  Elephant
//
//  Created by shen_h on 15/9/14.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "UserCollectionDataModel.h"

@implementation UserCollectionDataModel
- (instancetype)initWithCollectionDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)sharedCollectionWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithCollectionDictionary:dict];
}
@end
