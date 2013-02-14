//
//  ViewController.m
//  PinPong
//
//  Created by wasja on 1/27/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "ViewController.h"
#import "LevelEndViewController.h"
#import "Ball.h"
#import "Bullet.h"
#import "Wall.h"
#import "PlayerBoard.h"

@interface ViewController () 

@end

@implementation ViewController

@synthesize scoreLabel1;
@synthesize scoreLabel2;
@synthesize objects;
@synthesize statusGameString;
@synthesize topWall;
@synthesize bottomWall;
@synthesize leftWall;
@synthesize rightWall;
@synthesize board;
@synthesize board2;


-(void)viewDidLoad
{
    [super viewDidLoad];
    scores1 = 0;
    scores2 = 0;
    
    objects = [[NSMutableArray alloc] init];
    
    [self addBall];
    [self addWall];
    [self movementFire];
    [self addBoards];

    gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                     target:self
                                   selector:@selector(timer)
                                   userInfo:nil
                                    repeats:YES];
}




-(void) addBoards
{
    board = [[PlayerBoard alloc]initWithFrame:CGRectMake(160, 420, 85, 12)];
    board.backgroundColor = [UIColor redColor];
    board.cntrl = self;
    [self.view addSubview:board];
    [self.objects addObject:board];
    
    board2 = [[PlayerBoard alloc]initWithFrame:CGRectMake(160, 30, 85, 12)];
    board2.backgroundColor = [UIColor blackColor];
    board2.cntrl = self;
    board2.objectSpeed = CGPointMake(6, 0);
    [self.view addSubview:board2];
    [self.objects addObject:board2];
}


-(void) addWall
{
    topWall = [[Wall alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
    bottomWall = [[Wall alloc] initWithFrame:CGRectMake(0, 450, 310, 10)];
    leftWall = [[Wall alloc] initWithFrame:CGRectMake(0, 0, 10, 480)];
    rightWall = [[Wall alloc] initWithFrame:CGRectMake(310, 0, 10, 480)];
    
    topWall.cntrl = self;
    bottomWall.cntrl = self;
    leftWall.cntrl = self;
    rightWall.cntrl = self;
    
    topWall.objectSpeed = CGPointMake(0, 0);
    bottomWall.objectSpeed = CGPointMake(0, 0);
    leftWall.objectSpeed = CGPointMake(0, 0);
    rightWall.objectSpeed = CGPointMake(0, 0);

    [self.view addSubview:topWall];
    [self.view addSubview:bottomWall];
    [self.view addSubview:leftWall];
    [self.view addSubview:rightWall];
    
    [self.objects addObject:topWall];
    [self.objects addObject:bottomWall];
    [self.objects addObject:leftWall];
    [self.objects addObject:rightWall];
}


- (void) addBall
{
    Ball* ball = [[Ball alloc] initWithFrame:CGRectMake(100, 100, 26, 26)];
    ball.cntrl = self;
    ball.objectSpeed = CGPointMake(3, 3);
    [self.view addSubview:ball];
    [objects addObject:ball];
}


-(void) deleteBall
{
 //   [objects removeObjectsInArray:objects];
}


- (void)addBulletPlayer1
{
    Bullet* bullet = [[Bullet alloc] initWithFrame:CGRectMake(board.center.x, board.center.y-100 , 20, 40)];
    bullet.cntrl = self;
    bullet.objectSpeed = CGPointMake(0, -5);
    [self.view addSubview:bullet];
    [objects addObject:bullet];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)timer
{
    for (MovableObject* mv in self.objects ) {
        [mv updateObject];
    }
    
    NSMutableArray* objectsToDelete = [NSMutableArray array];
    for (MovableObject* mv in self.objects ) {
        if (mv.needDelete) {
            [objectsToDelete addObject:mv];
            [mv removeFromSuperview];
        }
    }
    
    [self.objects removeObjectsInArray:objectsToDelete];
    
    [self playRobot];
    [self updateScore];
    [self levelOver];
}


- (IBAction)addBallButtonTapped:(id)sender {
    [self addBall];
}


-(void)playRobot
{
    Ball* ball = [self nearestBall];
    
    static int speed = 3;
    Ball* lastBall = nil;
    if (lastBall != ball) {
        lastBall = ball;
        speed = 1 + rand() % 6;
    }
    
    if (ball.center.y <= self.view.center.y) {
        if (ball.center.x < board2.center.x) {
            CGPoint p = CGPointMake(board2.center.x-speed, board2.center.y);
            board2.center = p;
        }
        if (ball.center.x > board2.center.x) {
            CGPoint p = CGPointMake(board2.center.x+speed, board2.center.y);
            board2.center = p;
        }
    }
}


-(Ball*) nearestBall
{
    Ball* nearestBall = nil;
    float minDistance = MAXFLOAT;
    
    for (Ball* ball in self.objects) {
        float distance = ball.center.y - board2.center.y;
        if (distance < minDistance) {
            minDistance = distance;
            nearestBall = ball;
        }
    }
    return nearestBall;
}


- (void) onPlayer1HaveScore {
    scores1++;
}


- (void) onPlayer2HaveScore {
    scores2++;
}


-(void)updateScore
{
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


-(void) movementFire
{
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(addBulletPlayer1)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
}


-(void)fireAnimation
{
    ////
}


@end
