//
//  Bullet.m
//  PinPong
//
//  Created by wasja on 2/10/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BulletPlayer.h"


@implementation BulletPlayer 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bullet.png"];
        objectSpeed = CGPointMake (0, 5);
        numberCollideBulletPlayer = 0;
    }
    return self;
}


-(void) collideOccuredWithObject:(MovableObject*) collideObject {
    self.needDelete = YES;
    
    if (collideObject == (MovableObject*)self.cntrl.topWall) {
        [self.cntrl bulletPlayerFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.leftWall || collideObject == (MovableObject*)self.cntrl.rightWall) {
        [self.cntrl bulletPlayerFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.boardRobot) {
        [self.cntrl onPlayerHaveScore];
        [self.cntrl bulletPlayerFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.ball) {
        //// need delete ball
        [self.cntrl bulletPlayerFireAnimation];
        [self.cntrl onPlayerHaveScore];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bulletRobot) {
        [self.cntrl bulletPlayerFireAnimation];
        /// need delete bulletRobot
    }
    
    if (collideObject == (MovableObject*)self.cntrl.block) {
        [self.cntrl bulletPlayerFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDetonating) {
        [self.cntrl bulletPlayerFireAnimation];
        [self.cntrl onPlayerHaveScore];
        numberCollideBulletPlayer ++;
        if (numberCollideBulletPlayer == numberCollideBulletMax) {
            // need delete blockDetonation
        }
    }
}


@end
