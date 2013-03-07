//
//  SoundGame.h
//  PinPong
//
//  Created by wasja on 3/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

@interface SoundGame : NSObject

+ (void)playSound:(NSString*)soundName;

@end
