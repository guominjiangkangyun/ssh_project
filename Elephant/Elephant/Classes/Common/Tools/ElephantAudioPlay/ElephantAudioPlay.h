
#import <Foundation/Foundation.h>

@interface ElephantAudioPlay: NSObject
- (instancetype)initWithSongName;
+ (instancetype)avAudioPlayerWithSongName;
- (void)play:(NSString *)songName;
- (void)pause;
@property(nonatomic,getter=isPlaying,readonly)BOOL playing;
@end
