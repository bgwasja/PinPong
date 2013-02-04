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
@synthesize board;
@synthesize board2;
@synthesize scoreLabel1;
@synthesize scoreLabel2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    scores1 = 0;
    scores2 = 0;
    ballSpeed = CGPointMake (3, 3);
    [self ballTimer];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ballTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.009
                                             target:self
                                           selector:@selector(startGame)
                                           userInfo:nil
                                            repeats:YES];
}


-(void) startGame
{
    [self gameOver];
    [self playRobot];
    [self scorePlayers];
    
    ball.center = CGPointMake(ball.center.x + ballSpeed.x,
                              ball.center.y + ballSpeed.y);
    
    if(ball.center.x+10 >= self.view.bounds.size.width || ball.center.x <= 10) {
        ballSpeed.x = -ballSpeed.x;
    }
    
    if (CGRectIntersectsRect (ball.frame, board.frame)) {
        if(ball.center.y+25 > board.center.y) {
            ballSpeed.y = -ballSpeed.y;
        }
    }
    
    if (ball.center.y <= 10) {
        ballSpeed.y = -ballSpeed.y;
        scores1 ++;
        NSLog(@"Player-%d",scores1);
    }
    
    if (ball.center.y+10 >= self.view.bounds.size.height) {
        ballSpeed.y = -ballSpeed.y;
        scores2 ++;
        NSLog(@"Robot-%d", scores2);
    }
    
    if(CGRectIntersectsRect(ball.frame, board2.frame)) {
        if(ball.center.y-20 < board2.center.y) {
            ballSpeed.y = -ballSpeed.y;
        }
    }
}


-(void)scorePlayers
{
    scoreLabel1.text = [NSString stringWithFormat:@"%d",scores1];
    scoreLabel2.text = [NSString stringWithFormat:@"%d",scores2];
}


-(void)playRobot
{
    if (ball.center.y <= self.view.center.y) {
        if (ball.center.x < board2.center.x) {
            CGPoint p = CGPointMake(board2.center.x-2, board2.center.y);
            board2.center = p;
        }
        if (ball.center.x > board2.center.x) {
            CGPoint p = CGPointMake(board2.center.x+2, board2.center.y);
            board2.center = p;
        }
    }
}


-(void)gameOver
{
    if (scores1 == 5 || scores2 == 5) {
        NSString *str;
        if (scores1 == 5) {
            str = [NSString stringWithFormat:@"You win !!!"];
        }
        if (scores2 == 5) {
            str = [NSString stringWithFormat:@"You lost !!!"];
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game over !!!"
                                                              message:str
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
        [alert show];
        scores1 = 0;
        scores2 = 0;
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    CGPoint xLocation = CGPointMake(touchLocation.x, board.center.y);
    board.center = xLocation;
}



@end
