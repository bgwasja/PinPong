//
//  ViewController.m
//  PinPong
//
//  Created by wasja on 1/27/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "ViewController.h"
#import "LevelEndViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize board;
@synthesize board2;
@synthesize scoreLabel1;
@synthesize scoreLabel2;
@synthesize balls;
@synthesize statusGameString;


-(void)viewDidLoad
{
    [super viewDidLoad];
    scores1 = 0;
    scores2 = 0;
    addBall=3;
    
    balls = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < addBall; i++) {
        Ball* ball = [[Ball alloc] initWithFrame:CGRectMake(100, 100, 26, 26)];
        ball.cntrl = self;
        ball.ballSpeed = CGPointMake(3+i, 3+i);
        [self.view addSubview:ball];
        [balls addObject:ball];
    }
    
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                     target:self
                                   selector:@selector(timer)
                                   userInfo:nil
                                    repeats:YES];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)timer
{
    for (Ball* ball in self.balls) {
        [ball updateBall];
    }
    [self playRobot];
    [self updateScore];
    [self levelOver];
}


- (IBAction)addBallButtonTapped:(id)sender {
    addBall++;
    [self viewDidLoad];
}


-(void)playRobot
{
    Ball* ball = [self nearestBall];
    if (ball.center.y <= self.view.center.y) {
        if (ball.center.x < board2.center.x) {
            CGPoint p = CGPointMake(board2.center.x-5, board2.center.y);
            board2.center = p;
        }
        if (ball.center.x > board2.center.x) {
            CGPoint p = CGPointMake(board2.center.x+5, board2.center.y);
            board2.center = p;
        }
    }
}


-(Ball*) nearestBall
{
    Ball* ball1 = [balls objectAtIndex:0];
    Ball* ball2 = [balls objectAtIndex:1];
    Ball* ball3 = [balls objectAtIndex:2];
    
    if (((ball1.center.y - board2.center.y) <= (ball2.center.y - board2.center.y)) && ((ball1.center.y - board2.center.y) <= (ball3.center.y - board2.center.y))) {
        return ball1;
    }
    
    if (((ball2.center.y - board2.center.y) <= (ball3.center.y - board2.center.y)) && ((ball2.center.y - board2.center.y) <= (ball1.center.y - board2.center.y))) {
        return ball2;
    }
    
    if (((ball3.center.y - board2.center.y) <= (ball1.center.y - board2.center.y)) && ((ball3.center.y - board2.center.y) <= (ball2.center.y - board2.center.y))) {
        return ball3;
    }
    return 0;
}


-(void)updateScore
{
    Ball* ball1 = [balls objectAtIndex:0];
    Ball* ball2 = [balls objectAtIndex:1];
    Ball* ball3 = [balls objectAtIndex:2];
    
    if ((ball1.center.y <= 10) || (ball2.center.y <= 10) || (ball3.center.y <= 10)) {
        scores1++;
    }
    
    if ((ball1.center.y+10 > self.view.bounds.size.height) || (ball2.center.y+10 > self.view.bounds.size.height) || (ball3.center.y+10 > self.view.bounds.size.height)) {
        scores2++;
    }

    scoreLabel1.text = [NSString stringWithFormat:@"%d",scores1];
    scoreLabel2.text = [NSString stringWithFormat:@"%d",scores2];
}


-(void)levelOver
{
    if (scores1 == 15 || scores2 == 15) {
        if (scores1 == 15) {
            statusGameString = [NSString stringWithFormat:@"You win !!!"];
        }
        if (scores2 == 15) {
            statusGameString = [NSString stringWithFormat:@"You loser !!!"];
        }
    [self performSegueWithIdentifier:@"level" sender:self];
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    CGPoint xLocation = CGPointMake(touchLocation.x, board.center.y);
    board.center = xLocation;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"level"]) {
        LevelEndViewController* c = (LevelEndViewController*)segue.destinationViewController;
        c.view;
        [c setScore1:[scoreLabel1.text intValue]];
        [c setScore2:[scoreLabel2.text intValue]];
        [c setStatusGame:statusGameString];
    }
}


@end
