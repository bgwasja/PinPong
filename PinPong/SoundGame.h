//
//  SoundGame.h
//  PinPong
//
//  Created by wasja on 3/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundGame : NSObject{
    AVAudioPlayer *effect;
}

@property (nonatomic, retain) AVAudioPlayer *effect;

+(SoundGame*)sharedSoundGame;
-(void)playSound:(NSString*)soundName;

@end
