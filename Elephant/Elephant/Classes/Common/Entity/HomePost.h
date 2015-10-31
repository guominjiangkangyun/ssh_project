//
//  HomePost.h
//  Elephant
//
//  Created by YZQ on 15/9/7.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface HomePost : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * authorId;
@property (nonatomic, retain) NSString * authorName;
@property (nonatomic, retain) NSNumber * isExpertRecommand;
@property (nonatomic, retain) NSNumber * isCollection;
@property (nonatomic, retain) NSNumber * favCnt;
@property (nonatomic, retain) NSNumber * priaseCnt;
@property (nonatomic, retain) NSNumber * repleCnt;
@property (nonatomic, retain) NSDate * postTime;
@property (nonatomic, retain) NSNumber * imgId;
@property (nonatomic, retain) NSNumber * isHot;
@property (nonatomic, retain) NSNumber * isExtractive;
@property (nonatomic, retain) NSNumber * isTop;
@property (nonatomic, retain) NSNumber * isIncludePic;
@property (nonatomic, retain) NSNumber * isCourse;

@end
