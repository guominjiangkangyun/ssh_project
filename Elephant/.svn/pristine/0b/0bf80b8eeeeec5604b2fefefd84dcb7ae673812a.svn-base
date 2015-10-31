//
//  ElephantViewController.m
//  Elephant
//
//  Created by shen_h on 15/9/17.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "ElephantVedioController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>

@interface ElephantVedioController ()
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ElephantVedioController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatVedioView];
}

- (void)creatVedioView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"popeye.mp4" ofType:nil];
    NSLog(@"%@",path);
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
    
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.frame = CGRectMake(0, 64, SCREEN_WIDTH, 200);
    [self.view.layer addSublayer:layer];
    [player play];

   
}

- (void)playVedio
{
    
}
@end
