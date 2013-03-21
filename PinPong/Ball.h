//
//  Ball.h
//  PinPong
//
//  Created by wasja on 1/31/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovableObject.h"

@interface Ball : MovableObject {

}

-(void) collideOccuredWithObject:(MovableObject*) collideObject;

@end
