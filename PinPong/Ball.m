//
//  Ball.m
//  PinPong
//
//  Created by wasja on 1/31/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize cntrl, ballSpeed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"ball.png"];
        ballSpeed = CGPointMake (3, 3);
    }
    return self;
}


-(void)updateBall
{
    self.center = CGPointMake(self.center.x + ballSpeed.x,
                          self.center.y + ballSpeed.y);

    if (self.center.x+10 >= cntrl.view.bounds.size.width || self.center.x <= 10) {
        ballSpeed.x = -ballSpeed.x;
    }

    if (CGRectIntersectsRect (self.frame, cntrl.board.frame)) {
        if(self.center.y+25 > cntrl.board.center.y) {
            ballSpeed.y = -ballSpeed.y;
        }
    }
    
    if (CGRectIntersectsRect(self.frame, cntrl.board2.frame)) {
        if(self.center.y-20 < cntrl.board2.center.y) {
            ballSpeed.y = -ballSpeed.y;
        }
    }
    
    if (self.center.y <= 10) {
        ballSpeed.y = -ballSpeed.y;
    }
    
    if (self.center.y+10 >= cntrl.view.bounds.size.height) {
        ballSpeed.y = -ballSpeed.y;
    }
}


@end
