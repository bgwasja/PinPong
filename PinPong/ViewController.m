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
@synthesize board;


- (void)viewDidLoad
{
    [super viewDidLoad];
    ballSpeed = CGPointMake (12, 12);
    [NSTimer scheduledTimerWithTimeInterval:0.04
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
    
    if (CGRectIntersectsRect (ball.frame, board.frame)) {
        ballSpeed.y = -ballSpeed.y;
    }
}


-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    board.center = touchLocation;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    
    if ([touch view] == board)
    {
        board.center = touchLocation;
    }
}


@end
