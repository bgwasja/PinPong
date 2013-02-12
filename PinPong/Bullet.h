//
//  Bullet.h
//  PinPong
//
//  Created by wasja on 2/10/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovableObject.h"

@interface Bullet : MovableObject {
}

-(void) collideOccuredWithObject:(MovableObject*) collideObject;

@end
