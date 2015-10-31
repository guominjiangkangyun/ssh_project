//
//  UserCollection.h
//  Elephant
//
//  Created by shen_h on 15/9/10.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserCollection : NSManagedObject

@property (nonatomic, retain) NSNumber * author;
@property (nonatomic, retain) NSString * favPostDetailUrl;
@property (nonatomic, retain) NSNumber * iconId;
@property (nonatomic, retain) NSNumber * isCourse;
@property (nonatomic, retain) NSNumber * isExpert;
@property (nonatomic, retain) NSNumber * isExtractive;
@property (nonatomic, retain) NSNumber * isHot;
@property (nonatomic, retain) NSNumber * isIncludePic;
@property (nonatomic, retain) NSNumber * isTop;
@property (nonatomic, retain) NSNumber * postId;
@property (nonatomic, retain) NSDate * postTime;
@property (nonatomic, retain) NSNumber * replys;
@property (nonatomic, retain) NSNumber * supports;
@property (nonatomic, retain) NSString * title;

@end
