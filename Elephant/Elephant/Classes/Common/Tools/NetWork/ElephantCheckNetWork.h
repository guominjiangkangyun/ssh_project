//
//  ElephantCheckNetWork.h
//  Elephant
//
//  Created by shen_h on 15/9/10.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ElephantCheckNetWork : NSObject

+ (instancetype)defaultNetWork;

- (BOOL)isLoaclExistNetWork;//备用

- (void)addCheckNetWorkObserver:(UIViewController *)observer selector:(SEL)aSelector;

- (void)reachabilityNetWorkChanged:(NSNotification *)info;


@end
