//
//  ElephantCheckNetWork.m
//  Elephant
//
//  Created by shen_h on 15/9/10.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "ElephantCheckNetWork.h"
#import "Reachability.h"

static id _instance;
@interface ElephantCheckNetWork ()
@property (nonatomic,strong) UIViewController *controller;
@end
@implementation ElephantCheckNetWork

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)defaultNetWork{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (BOOL)isLoaclExistNetWork
{
    BOOL isExistenceNetwork;
    
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([reachability currentReachabilityStatus]) {
            
        case NotReachable:
            isExistenceNetwork = FALSE;
            break;
            
        case ReachableViaWWAN:
            isExistenceNetwork = TRUE;
            break;
            
        case ReachableViaWiFi:
            isExistenceNetwork = TRUE;
            break;
    }
    return isExistenceNetwork;
}
- (void)CheckNetWorkChangedWhenUsedController:(UIViewController *)controller
{
    _controller = controller;
    
    [[NSNotificationCenter defaultCenter] addObserver:controller selector:@selector(reachabilityNetWorkChanged:) name:kReachabilityChangedNotification object:nil];
    
    Reachability *hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    [hostReach startNotifier];
    
}
- (void)addCheckNetWorkObserver:(UIViewController *)observer selector:(SEL)aSelector
{
    _controller = observer;
    
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:kReachabilityChangedNotification object:nil];
    
    Reachability *hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    [hostReach startNotifier];
}

- (void)reachabilityNetWorkChanged:(NSNotification *)info
{
    Reachability *current = [info object];
    
    NSParameterAssert([current isKindOfClass:[Reachability class]]);
    
    NSString *alerShowString = nil;
    
    switch ([current currentReachabilityStatus]) {
            
        case NotReachable:
            alerShowString = @"没有可用网络";
            break;
            
        case ReachableViaWiFi:
            alerShowString = @"打开了WiFi";;
            break;
            
        case ReachableViaWWAN:
            alerShowString = @"打开了3G/4G网络";
            break;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:alerShowString delegate:self.controller cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
    [alert show];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self.controller forKeyPath:kReachabilityChangedNotification];
}

@end
