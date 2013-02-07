//
//  Ball.h
//  PinPong
//
//  Created by wasja on 1/31/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class ViewController;

@interface Ball : UIImageView {
    CGPoint ballSpeed;
}

@property(assign, nonatomic) CGPoint ballSpeed;
@property(retain, nonatomic) ViewController *cntrl;

-(void) updateBall;

@end
