//
//  Ball.m
//  PinPong
//
//  Created by wasja on 1/31/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Ball.h"
#import "BulletPlayer.h"
#import "BulletRobot.h"

@implementation Ball

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"ball.png"];
        objectSpeed = CGPointMake (1, 1);
    }
    return self;
}


-(void) collideOccuredWithObject:(MovableObject*) collideObject {
   
    if (collideObject == (MovableObject*)self.cntrl.topWall) {
        [self.cntrl onPlayerHaveScore];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bottomWall) {
        [self.cntrl onRobotHaveScore];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bulletPlayer) {
        self.needDelete = YES;
        if ([collideObject isKindOfClass:[BulletPlayer class]]) {
            collideObject.needDelete = YES;
            [self.cntrl bulletPlayerFireAnimation];
            [self.cntrl onPlayerHaveScore];
        }
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bulletRobot) {
        self.needDelete = YES;
        if ([collideObject isKindOfClass:[BulletRobot class]]) {
            collideObject.needDelete = YES;
            [self.cntrl bulletRobotFireAnimation];
            [self.cntrl onRobotHaveScore];
        }
    }
    
}

@end
