//
//  HomeTopScrollView.h
//  Elephant
//
//  Created by YZQ on 15/9/9.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TOP_SCROLLVIEW_HEIGHT 44

@interface HomeTopScrollView : UIScrollView<UIScrollViewDelegate>
{
    NSInteger userSelectedChannelID;        //点击按钮选择名字ID
    UIImageView *shadowImageView;   //选中阴影
}


@property (nonatomic, retain) NSArray *titles;
@property(nonatomic,retain)NSMutableArray *titleXs;
@property(nonatomic,retain)NSMutableArray *titleBtns;

@property (nonatomic, assign) NSInteger scrollViewSelectedChannelID;

+ (HomeTopScrollView *)shareInstance;

- (void)initHeadButtons;

- (void)setButtonUnSelected;
- (void)setButtonSelected;
-(void)setScrollViewContentX;

@end
