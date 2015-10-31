//
//  AccountDataModel.h
//  Elephant
//
//  Created by shen_h on 15/9/14.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountDataModel : NSObject

@property (nonatomic, assign) double Concerns;
@property (nonatomic, strong) NSString * Department;
@property (nonatomic, assign) double Fans;
@property (nonatomic, assign) double Gender;
@property (nonatomic, strong) NSString * Hospital;
@property (nonatomic, assign) double IconId;
@property (nonatomic, assign) double Id;
@property (nonatomic, assign) double Integral;
@property (nonatomic, assign) long Name;
@property (nonatomic, strong) NSString * Region;
@property (nonatomic, strong) NSString * Signature;
@property (nonatomic, strong) NSString * Title;
@property (nonatomic, strong) NSString * UserId;

+ (instancetype)shareInstance;
- (instancetype)initWithAccountDictionary:(NSDictionary *)dict;
+ (instancetype)sharedAccountDataWithDictionary:(NSDictionary *)dict;

@end
