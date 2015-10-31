//
//  UserChatMeDictAttribut.h
//  Elephant
//
//  Created by shen_h on 15/9/11.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserChatMeDictAttribut : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * iconId;
@property (nonatomic, retain) NSDate * postTime;
@property (nonatomic, retain) NSNumber * receiver;
@property (nonatomic, retain) NSNumber * sender;
@property (nonatomic, retain) NSNumber * sendId;

@end
