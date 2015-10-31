
#import "ElephantAudioPlay.h"
#import <AVFoundation/AVFoundation.h>

@interface ElephantAudioPlay()
@property(nonatomic,strong)NSMutableDictionary *dict;
@property(nonatomic,strong)NSString *songName;
@property(nonatomic,strong)AVAudioPlayer *player;
@end
@implementation ElephantAudioPlay
- (instancetype)initWithSongName
{
        if(self=[super init]){
                self.dict = [NSMutableDictionary dictionary];
        }
        return self;
}
+ (instancetype)avAudioPlayerWithSongName
{
        return [[self alloc] initWithSongName];
}
- (void)play:(NSString *)songName
{
        if(self.player!=nil){
                [self.player stop];
        }
        self.songName = songName;
        if(self.songName==nil || self.songName.length==0){
                return;
        }
        NSString *path = [[NSBundle mainBundle] pathForResource:self.songName ofType:nil];
        //判断文件是否赋为空
        NSFileManager *mgr = [NSFileManager defaultManager];
        if(![mgr fileExistsAtPath:path]){
                return;
        }
        AVAudioPlayer *player = self.dict[self.songName];
        if(player==nil){
                NSURL *url = [NSURL fileURLWithPath:path];
                player=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                self.dict[self.songName] = player;
        }
        self.player = player;
        [player play];
//        _playing = YES;
}
- (void)pause
{
        if(self.player==nil){
                return;
        }
        if([self.player isPlaying]){
                [self.player pause];
//                _playing = NO;
        }
}
@end
