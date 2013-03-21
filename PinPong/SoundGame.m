//
//  SoundGame.m
//  PinPong
//
//  Created by wasja on 3/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "SoundGame.h"

@implementation SoundGame

@synthesize effect;

+(SoundGame *)sharedSoundGame {
    static SoundGame *sharedSoundGame = nil;
    if (sharedSoundGame == nil){
        sharedSoundGame = [[self alloc] init];
    }
    return sharedSoundGame;
}


-(void)playSound:(NSString*)soundName{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: soundName ofType:@"mp3"]];
    effect = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [effect setNumberOfLoops:0];
    [effect prepareToPlay];
    [effect play];
}

@end
