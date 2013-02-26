//
//  BulletRobot.m
//  PinPong
//
//  Created by wasja on 2/21/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BulletRobot.h"

@implementation BulletRobot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bulletRobot.png"];
        objectSpeed = CGPointMake (0, 5);
        numberCollideBulletRobot = 0;
    }
    return self;
}


-(void) collideOccuredWithObject:(MovableObject*) collideObject {
    self.needDelete = YES;
    
    if (collideObject == (MovableObject*)self.cntrl.bottomWall) {
        [self.cntrl bulletRobotFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.leftWall || collideObject == (MovableObject*)self.cntrl.rightWall) {
        [self.cntrl bulletRobotFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.boardPlayer) {
        [self.cntrl onRobotHaveScore];
        [self.cntrl bulletRobotFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.ball ) {
        //// need delete ball
        [self.cntrl bulletRobotFireAnimation];
        [self.cntrl onRobotHaveScore];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.block) {
        [self.cntrl bulletRobotFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDetonating) {
        [self.cntrl bulletRobotFireAnimation];
        [self.cntrl onRobotHaveScore];
        numberCollideBulletRobot++;
        if (numberCollideBulletRobot == numberCollideBulletMax) {
            // need delete blockDetonation
        }
    }
}

@end
