//
//  BulletRobot.m
//  PinPong
//
//  Created by wasja on 2/21/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BulletRobot.h"
#import "Ball.h"
#import "BlockDetonating.h"
#import "BulletPlayer.h"

@implementation BulletRobot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bulletRobot.png"];
        objectSpeed = CGPointMake (0, 5);
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
        if ([collideObject isKindOfClass:[Ball class]]) {
            collideObject.needDelete = YES;
        }        
        [self.cntrl bulletRobotFireAnimation];
        [self.cntrl onRobotHaveScore];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.block) {
        [self.cntrl bulletRobotFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDetonating) {
        numberCollideBulletRobot++;
        if (numberCollideBulletRobot == numberCollideBulletMax) {
            if ([collideObject isKindOfClass:[BlockDetonating class]]) {
                collideObject.needDelete = YES;
                [self.cntrl onRobotHaveScore];
            }
        } 
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bulletPlayer) {
        if ([collideObject isKindOfClass:[BulletPlayer class]]) {
            collideObject.needDelete = YES;
            [self.cntrl bulletPlayerFireAnimation];
        }
    }
    
}

@end
