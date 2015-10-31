//
//  UserMessage.h
//  Elephant
//
//  Created by shen_h on 15/9/9.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserMessage : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * iconId;
@property (nonatomic, retain) NSNumber * isCollection;
@property (nonatomic, retain) NSNumber * isCourse;
@property (nonatomic, retain) NSNumber * isSupport;
@property (nonatomic, retain) NSNumber * postId;
@property (nonatomic, retain) NSDate * postTime;
@property (nonatomic, retain) NSString * postTitle;
@property (nonatomic, retain) NSNumber * replyId;
@property (nonatomic, retain) NSString * sender;
@property (nonatomic, retain) NSNumber * senderId;
@property (nonatomic, retain) NSNumber * supports;

@end
