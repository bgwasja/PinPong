//
//  MovableObject.m
//  PinPong
//
//  Created by wasja on 2/11/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "MovableObject.h"

@implementation MovableObject

@synthesize cntrl;
@synthesize objectSpeed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void) collideOccuredWithObject:(MovableObject*) collideObject{
}


-(void)updateObject{
    
    for (MovableObject* mv in cntrl.objects) {
        if (self != mv) {
            if (CGRectIntersectsRect(CGRectOffset(self.frame, objectSpeed.x, 0) , mv.frame)) {
                objectSpeed.x = -objectSpeed.x;
                [self collideOccuredWithObject:mv];
            }
            if (CGRectIntersectsRect(CGRectOffset(self.frame, 0, objectSpeed.y) , mv.frame)) {
                objectSpeed.y = -objectSpeed.y;
                [self collideOccuredWithObject:mv];
            }
        }
    }

    self.center = CGPointMake(self.center.x + objectSpeed.x,
                              self.center.y + objectSpeed.y);

    
//    
//    
//    if (self.center.x+10 >= cntrl.view.bounds.size.width) {
//         objectSpeed.x = -objectSpeed.x;
//        [self collideOccuredWithObject:cntrl.rightWall];
//    }
//    
//    if (self.center.x <= 10) {
//         objectSpeed.x = -objectSpeed.x;
//        [self collideOccuredWithObject:cntrl.leftWall];
//    }
//    
//    if (CGRectIntersectsRect (self.frame, cntrl.board.frame)) {
//        if(self.center.y+25 > cntrl.board.center.y) {
//             objectSpeed.y = -objectSpeed.y;
//            [self collideOccuredWithObject:cntrl.board];
//        }
//    }
//    
//    if (CGRectIntersectsRect(self.frame, cntrl.board2.frame)) {
//        if(self.center.y-20 < cntrl.board2.center.y && objectSpeed.y < 0) {
//             objectSpeed.y = -objectSpeed.y;
//            [self collideOccuredWithObject:cntrl.board2];
//        }
//    }
//    
//    if (self.center.y <= 10) {
//         objectSpeed.y = -objectSpeed.y;
//        [self collideOccuredWithObject:cntrl.topWall];
//    }
//    
//    if (self.center.y+10 >= cntrl.view.bounds.size.height) {
//         objectSpeed.y = -objectSpeed.y;
//        [self collideOccuredWithObject:cntrl.bottomWall];
//    }
    
}


@end
