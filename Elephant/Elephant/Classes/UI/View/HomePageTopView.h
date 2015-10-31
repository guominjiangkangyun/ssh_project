//
//  HomePageTopView.h
//  Elephant
//
//  Created by shen_h on 15/9/23.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageTopView : UIScrollView
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSMutableArray *imageViews;


- (UIScrollView *)creatScrollerViewWithImages:(NSArray *)images count:(int)imageCount frame:(CGRect)frame;
- (void)scrollerViewAddImageViews:(UIImageView *)imageView;

@end
