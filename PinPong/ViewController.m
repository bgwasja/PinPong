//
//  ViewController.m
//  PinPong
//
//  Created by wasja on 1/27/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize ball;


- (void)viewDidLoad
{
    [super viewDidLoad];
    ballSpeed = CGPointMake (12, 12);
    [NSTimer scheduledTimerWithTimeInterval:0.06
                                     target:self
                                   selector:@selector(ballMove)
                                   userInfo:nil
                                    repeats:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) ballMove
{
    ball.center = CGPointMake(ball.center.x + ballSpeed.x,
                          ball.center.y + ballSpeed.y);
    
    if(ball.center.x+18 >= self.view.bounds.size.width || ball.center.x <= 18) {
    ballSpeed.x = -ballSpeed.x;
    }
    
    if(ball.center.y+18 >= self.view.bounds.size.height || ball.center.y <= 18) {
    ballSpeed.y = -ballSpeed.y;
    }
}


@end
