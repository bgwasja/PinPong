//
//  Ball.m
//  PinPong
//
//  Created by wasja on 1/31/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Ball.h"

@implementation Ball

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"ball.png"];
        objectSpeed = CGPointMake (3, 3);
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

    }
}

@end
