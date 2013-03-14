//
//  BulletRobotSpecial.m
//  PinPong
//
//  Created by wasja on 3/14/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BulletRobotSpecial.h"


@implementation BulletRobotSpecial

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bulletRobot.png"];
        objectSpeed = CGPointMake (0, 8);
    }
    return self;
}

-(void) collideOccuredWithObject:(MovableObject*) collideObject {
    self.needDelete = YES;
    //    [[SoundGame sharedSoundGame] playSound:@"bulletDetonating"];
    
    if (collideObject == (MovableObject*)self.cntrl.boardPlayer) {
        [self.cntrl bulletRobotFireAnimation];
        [self.cntrl onRobotHaveScore];
 //       collideObject.needDelete = YES;
        
        //// min size player board
    }
    
}


@end
