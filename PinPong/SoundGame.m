//
//  SoundGame.m
//  PinPong
//
//  Created by wasja on 3/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "SoundGame.h"

@implementation SoundGame

+ (void)playSound:(NSString*)soundName {
    SystemSoundID volleyFile;
    NSString *volleyPath = [[NSBundle mainBundle] pathForResource:soundName ofType:nil];
    CFURLRef volleyURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:volleyPath];
    AudioServicesCreateSystemSoundID (volleyURL, &volleyFile);
    AudioServicesPlaySystemSound(volleyFile);
}


@end
