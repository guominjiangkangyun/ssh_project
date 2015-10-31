//
//  HomeRootScrollView.h
//  Elephant
//
//  Created by YZQ on 15/9/9.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeRootScrollView : UIScrollView <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    CGFloat contentOffsetX;
    BOOL isLeftScroll;
}
@property (nonatomic, retain) NSArray *viewNames;

+ (HomeRootScrollView *)shareInstance;
- (void)initWithViews;
- (void)loadData;

@end
