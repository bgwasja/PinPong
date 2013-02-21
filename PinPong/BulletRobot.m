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
    
    if (collideObject == (MovableObject*)self.cntrl.board) {
        [self.cntrl onPlayer2HaveScore];
        [self.cntrl bulletRobotFireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.ball ) {
        //// need delete ball
        [self.cntrl bulletRobotFireAnimation];
        [self.cntrl onPlayer2HaveScore];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.block) {
        [self.cntrl bulletRobotFireAnimation];
    }
}

@end
