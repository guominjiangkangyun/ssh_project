
#import "UIImageView+CircleImage.h"

@implementation UIImageView (CircleImage)
+ (UIImageView *)circleImageWithImageName:(NSString *)imageName viewFrame:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = frame.size.width/2;
    
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
    }
    
    return imageView;
    
}

+ (UIImageView *)circleImageWithImageName:(NSString *)imageName viewFrame:(CGRect)frame borderCorlor:(UIColor *)color borderWidth:(CGFloat)width
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = frame.size.width/2;;
    imageView.layer.borderColor = color.CGColor;
    imageView.layer.borderWidth = width;
    
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
    }
    
    
    return imageView;
    
}

+ (UIImageView *)circleImageWithImage:(UIImage *)image viewFrame:(CGRect)frame 
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = frame.size.width/2;;

    imageView.image = image;
    return imageView;

}
@end
