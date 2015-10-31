//
//  HomePageTopView.m
//  Elephant
//
//  Created by shen_h on 15/9/23.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "HomePageTopView.h"

#define SCROLLEVIEW_FRAME [[UIScreen mainScreen] applicationFrame]

@implementation HomePageTopView
@synthesize images = _images;
@synthesize imageViews = _imageViews;

- (UIScrollView *)creatScrollerViewWithImages:(NSArray *)images count:(int)imageCount frame:(CGRect)frame
{
    UIScrollView *scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCROLLEVIEW_FRAME.size.width,100)];
    int count = self.imageViews.count;
    for (int i = 0; i < count; i ++) {
        UIImageView *imageView = self.imageViews[i];
        imageView.image = self.images[i];
    }
    scrollerView.showsHorizontalScrollIndicator = NO;
    scrollerView.showsVerticalScrollIndicator = NO;
    scrollerView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * imageCount, [UIScreen mainScreen].bounds.size.height);
    
    scrollerView.pagingEnabled = YES;
    scrollerView.bounces = NO;
    
    UIPageControl *pageConteol = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, 100, 50, 40)];
    pageConteol.numberOfPages = 3;

    [scrollerView addSubview: pageConteol];
    return scrollerView;
    
}
- (NSMutableArray *)images
{
    if (!_images) {
        _images = [NSMutableArray arrayWithCapacity:3];
    }
    return _images;
}
- (void)setImages:(NSMutableArray *)images
{
    _images = images;
}
- (NSMutableArray *)imageViews
{
    if (!_imageViews) {
        _imageViews = [NSMutableArray arrayWithCapacity:3];
    }
    return _imageViews;
}
- (void)setImageViews:(NSMutableArray *)imageViews
{
    _imageViews = imageViews;
}

- (void)scrollerViewAddImageViews:(UIImageView *)imageView
{
    [self.imageViews addObject:imageView];
}

@end
