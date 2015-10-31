

#import <UIKit/UIKit.h>

@interface UIImageView (CircleImage)


//frame 的宽高一样
+ (UIImageView *)circleImageWithImageName:(NSString *)imageName viewFrame:(CGRect)frame ;

+ (UIImageView *)circleImageWithImageName:(NSString *)imageName viewFrame:(CGRect)frame borderCorlor:(UIColor *)color borderWidth:(CGFloat)width;

+ (UIImageView *)circleImageWithImage:(UIImage *)image viewFrame:(CGRect)frame ;
@end
