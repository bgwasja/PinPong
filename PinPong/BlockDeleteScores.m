//
//  BlockDeleteScores.m
//  PinPong
//
//  Created by wasja on 3/5/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BlockDeleteScores.h"
#import "BulletPlayer.h"
#import "BulletRobot.h"
#import "SoundGame.h"


@implementation BlockDeleteScores

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"blockDeleteScores.jpeg"];
        objectSpeed = CGPointMake (0, 0);
    }
    return self;
    numberCollideBulletPlayer = 0;
    numberCollideBulletRobot = 0;
}

-(void) collideOccuredWithObject:(MovableObject*) collideObject {
    
    if (collideObject == (MovableObject*)self.cntrl.blockDeleteScores) {
        numberCollideBulletPlayer++;
        [self.cntrl bulletPlayerFireAnimation];
        if (numberCollideBulletPlayer == numberCollideBulletBlock) {
            if ([collideObject isKindOfClass:[BlockDeleteScores class]]) {
                collideObject.needDelete = YES;
                [self.cntrl deleteRobotScore];
                [[SoundGame sharedSoundGame] playSound:@"blockDeleteScores"];
            }
        }
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDeleteScores) {
        numberCollideBulletRobot++;
        [self.cntrl bulletRobotFireAnimation];
        if (numberCollideBulletRobot == numberCollideBulletBlock) {
            if ([collideObject isKindOfClass:[BlockDeleteScores class]]) {
                collideObject.needDelete = YES;
                [self.cntrl deletePlayerScore];
                [[SoundGame sharedSoundGame] playSound:@"blockDeleteScores"];
            }
        }
    }
    
}
@end
