//
//  MovableObject.h
//  PinPong
//
//  Created by wasja on 2/11/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface MovableObject : UIImageView {
    CGPoint objectSpeed;
}

@property (retain, nonatomic) ViewController *cntrl;
@property (assign, nonatomic) CGPoint objectSpeed;
@property (assign, nonatomic) BOOL needDelete;

-(void) updateObject;
-(void) collideOccuredWithObject:(MovableObject*) collideObject;

@end