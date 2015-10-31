//
//  NotificationService.m
//  YiBan
//
//  Created by fenxiang on 14-9-24.
//  Copyright (c) 2014年 ZKK. All rights reserved.
//

#import "NotificationService.h"

@implementation NotificationService
+ (NSInteger)getNotificationNum{

    NSInteger num = 0;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSString *user = [defaults stringForKey:@"user"];
    if (![user isEqualToString:@""]) {
        num= [defaults integerForKey:user];
    }
   
    return num;

}
+ (void)setNotificationNum:(NSInteger)arg{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSString *user = [defaults stringForKey:@"user"];
    NSInteger num = [defaults integerForKey:@"user"];
    if (![user isEqualToString:@""]) {
     [defaults setInteger:arg+num forKey:user];
    }
   

}
+ (void)setTagsAlias:(NSString *)tags{
//    if (![tags isEqualToString:@""]) {
//        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
//        [defaults  setObject:tags forKey:@"user"];
//    }
    [APService setTags:nil alias:tags callbackSelector:nil target:nil];
}
+ (void)tagsAliasCallback:(int)iResCode tags:(NSSet*)tags alias:(NSString*)alias {
}
@end
