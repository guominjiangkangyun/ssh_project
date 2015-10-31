//
//  UserAddCollectionCell.m
//  Elephant
//
//  Created by shen_h on 15/9/16.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "UserAddCollectionCell.h"

@interface UserAddCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end
@implementation UserAddCollectionCell

- (void)awakeFromNib {
    self.cellImage.layer.borderWidth = 3;
    self.cellImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.cellImage.layer.cornerRadius = 3;
    self.cellImage.clipsToBounds = YES;
}
- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    self.cellImage.image = [UIImage imageNamed:imageName];
}
@end
