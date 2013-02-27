//
//  BulletRobot.h
//  PinPong
//
//  Created by wasja on 2/21/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "MovableObject.h"

#define numberCollideBulletMax 2

@interface BulletRobot : MovableObject

-(void) collideOccuredWithObject:(MovableObject*) collideObject;

@end
