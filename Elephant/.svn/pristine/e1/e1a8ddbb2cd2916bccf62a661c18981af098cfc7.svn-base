//
//  UserCollectionCell.m
//  Elephant
//
//  Created by shen_h on 15/9/9.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "UserCollectionCell.h"
#import "UIImageView+CircleImage.h"

@implementation UserCollectionCell


- (instancetype)initWithTableView:(UITableView *)tableView
{
    if (self = [super init]) {
        
        CGFloat padding = 10;
        CGFloat cellH = self.frame.size.height - padding;
        CGFloat cellW = 60;
        CGFloat cellY = cellH - 5.0;
        
        UIImageView *imageView = [UIImageView circleImageWithImageName:@"ic_login_weixin" viewFrame:CGRectMake(0, cellY, cellW, cellH)];
        imageView.backgroundColor = [UIColor greenColor];
        
        [self addSubview:imageView];
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"UserCollectionCell" owner:nil options:nil] lastObject];
        
    }
    return self;
}

@end
