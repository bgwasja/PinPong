//
//  Bullet.m
//  PinPong
//
//  Created by wasja on 2/10/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

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
        [self.cntrl fireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.bottomWall) {
        [self.cntrl fireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.leftWall || collideObject == (MovableObject*)self.cntrl.rightWall) {
        [self.cntrl fireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.board) {
        [self.cntrl fireAnimation];
    }
        
    if (collideObject == (MovableObject*)self.cntrl.board2) {
        [self.cntrl fireAnimation];
    }
    
    if (collideObject == (MovableObject*)self.cntrl.ball ) {
        ////
        [self.cntrl fireAnimation];
        [self.cntrl onPlayer1HaveScore];
    }

}


@end
