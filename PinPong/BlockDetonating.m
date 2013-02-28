//
//  BlockDetonating.m
//  PinPong
//
//  Created by wasja on 2/26/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BlockDetonating.h"
#import "BulletPlayer.h"
#import "BulletRobot.h"

@implementation BlockDetonating

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"blockDetonating.jpeg"];
        objectSpeed = CGPointMake (0, 0);
    }
    return self;
    numberCollideBulletPlayer = 0;
    numberCollideBulletRobot = 0;
}

-(void) collideOccuredWithObject:(MovableObject*) collideObject {
    
    if (collideObject == (MovableObject*)self.cntrl.blockDetonating) {
        numberCollideBulletPlayer++;
        [self.cntrl blockDetonationFireAnimation];
        if (numberCollideBulletPlayer == numberCollideBulletMax) {
            if ([collideObject isKindOfClass:[BlockDetonating class]]) {
                collideObject.needDelete = YES;
                [self.cntrl onPlayerHaveScore];
            }
        }
    }
    
    if (collideObject == (MovableObject*)self.cntrl.blockDetonating) {
        numberCollideBulletRobot++;
        [self.cntrl blockDetonationFireAnimation];
        if (numberCollideBulletRobot == numberCollideBulletMax) {
            if ([collideObject isKindOfClass:[BlockDetonating class]]) {
                collideObject.needDelete = YES;
                [self.cntrl onRobotHaveScore];
            }
        }
    }

}

@end
