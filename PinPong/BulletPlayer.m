//
//  Bullet.m
//  PinPong
//
//  Created by wasja on 2/10/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BulletPlayer.h"
#import "Ball.h"
#import "BulletRobot.h"
#import "BlockDetonating.h"
#import "BlockDeleteScores.h"
#import "SoundGame.h"



@implementation BulletPlayer 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bullet.png"];
        objectSpeed = CGPointMake (0, 5);
    }
    return self;
}


-(void) collideOccuredWithObject:(MovableObject*) collideObject {
    self.needDelete = YES;
    
    if (collideObject == (MovableObject*)self.cntrl.topWall) {
        [self.cntrl bulletPlayerFireAnimation];
         [[SoundGame sharedSoundGame] playSound:@"click"];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.leftWall || collideObject == (MovableObject*)self.cntrl.rightWall) {
        [self.cntrl bulletPlayerFireAnimation];
         [[SoundGame sharedSoundGame] playSound:@"click"];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.boardRobot) {
        [self.cntrl onPlayerHaveScore];
        [self.cntrl bulletPlayerFireAnimation];
        [[SoundGame sharedSoundGame] playSound:@"click"];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.ball) {
        if ([collideObject isKindOfClass:[Ball class]]) {
            collideObject.needDelete = YES;
        }
        [self.cntrl bulletPlayerFireAnimation];
        [self.cntrl onPlayerHaveScore];
        [[SoundGame sharedSoundGame] playSound:@"click"];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bulletRobot) {
        [self.cntrl bulletPlayerFireAnimation];
        if ([collideObject isKindOfClass:[BulletRobot class]]) {
            collideObject.needDelete = YES;
            [self.cntrl bulletPlayerFireAnimation];
        }
        [[SoundGame sharedSoundGame] playSound:@"click"];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.block) {
        [self.cntrl bulletPlayerFireAnimation];
        [[SoundGame sharedSoundGame] playSound:@"click"];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDetonating) {
        numberCollideBulletPlayer++;
        if (numberCollideBulletPlayer == numberCollideBulletMax) {
            if ([collideObject isKindOfClass:[BlockDetonating class]]) {
                collideObject.needDelete = YES;
                [self.cntrl onPlayerHaveScore];
                [self.cntrl onPlayerHaveScore];
                [self.cntrl blockDetonationFireAnimation];
                [[SoundGame sharedSoundGame] playSound:@"click"];
            }
        }
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDeleteScores) {
        numberCollideBulletPlayer++;
        if (numberCollideBulletPlayer == numberCollideBulletBlock) {
            if ([collideObject isKindOfClass:[BlockDeleteScores class]]) {
                collideObject.needDelete = YES;
                [self.cntrl deleteRobotScore];
                [self.cntrl blockDetonationFireAnimation];
                [[SoundGame sharedSoundGame] playSound:@"click"];
            }
        }
    }
}


@end
