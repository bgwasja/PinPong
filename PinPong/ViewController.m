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
#import "BulletRobot.h"
#import "Wall.h"
#import "PlayerBoard.h"
#import "Block.h"

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
@synthesize bullet;
@synthesize ball;
@synthesize animationImage;
@synthesize bulletRobot;
@synthesize block;

-(void)viewDidLoad
{
    [super viewDidLoad];
    scores1 = 0;
    scores2 = 0;
    
    objects = [[NSMutableArray alloc] init];

    NSLog(@"%d",levelId);
    
    for (int i = 0; i < levelId; i++) {
    [self addBall];
//  [self performSelector:@selector(addBall) withObject:nil afterDelay:2.0];
    }
    
    [self addWall];
    [self movementFire];
    [self addBoard];
    [self levelGame];
    
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.006
                                     target:self
                                   selector:@selector(timer)
                                   userInfo:nil
                                    repeats:YES];
    
    bulletRobotTimer = [NSTimer scheduledTimerWithTimeInterval:speedBulletAnimation
                                                        target:self
                                                      selector:@selector(addBulletPlayer2)
                                                      userInfo:nil
                                                       repeats:YES];
}

-(void)levelGame
{
    if (levelId >= 2) {[self addBlock];}
}


-(void) addBoard
{
    board = [[PlayerBoard alloc]initWithFrame:CGRectMake(160, 420, 85, 15)];
    board.backgroundColor = [UIColor redColor];
    board.cntrl = self;
    [self.view addSubview:board];
    [self.objects addObject:board];
    
    board2 = [[PlayerBoard alloc]initWithFrame:CGRectMake(160, 30, 85, 15)];
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
    ball = [[Ball alloc] initWithFrame:CGRectMake(100, 100, 26, 26)];
    ball.cntrl = self;
    ball.objectSpeed = CGPointMake(1, 1);
    [self.view addSubview:ball];
    [objects addObject:ball];
}


- (void)addBulletPlayer1
{
    bullet = [[Bullet alloc] initWithFrame:CGRectMake(board.center.x, board.center.y-100 , 20, 40)];
    bullet.cntrl = self;
    bullet.objectSpeed = CGPointMake(0, -1);
    [self.view addSubview:bullet];
    [objects addObject:bullet];
}


- (void)addBulletPlayer2
{
    bulletRobot = [[BulletRobot alloc] initWithFrame:CGRectMake(board.center.x, board2.center.y , 20, 40)];
    bulletRobot.cntrl = self;
    bulletRobot.objectSpeed = CGPointMake(0, 1);
    [self.view addSubview:bulletRobot];
    [objects addObject:bulletRobot];
}


-(void)addBlock
{
    block = [[Block alloc] initWithFrame:CGRectMake(140, 140, 50, 50)];
    block.cntrl = self;
    block.objectSpeed = CGPointMake(0, 0);
    [self.view addSubview:block];
    [self.objects addObject:block];
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
    [self gameOver];
    [self levelOver];
}


- (IBAction)addBallButtonTapped:(id)sender {
    [self addBall];
}


-(void)playRobot
{
    ball = [self nearestBall];
    static int speed = 1;
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
    
    for (ball in self.objects) {
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
    if (scores1 >= intMaxScore || scores2 >= intMaxScore) {
        if (scores1 >= intMaxScore) {
            statusGameString = [NSString stringWithFormat:@"You win !!!"];
            /// додати картинки
        }
        if (scores2 >= intMaxScore) {
            statusGameString = [NSString stringWithFormat:@"You loser !!!"];
            /// додати картинки
        }
    [self performSegueWithIdentifier:@"level" sender:self];
    }
}


-(void)gameOver
{
    if (levelId == intMaxLevel) {
        if (scores1 == intMaxScore || scores2 == intMaxScore) {
            [self performSegueWithIdentifier:@"gameOver" sender:self];
        }
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
    animationImage = [[UIImageView alloc] initWithFrame:CGRectMake (bullet.center.x, bullet.center.y, 15, 15)];
    [self.view addSubview:animationImage];
    animationImage.animationImages = [self creatAnimation:@"fireAnimation.jpg"];
    animationImage.animationDuration = 0.9;
    animationImage.animationRepeatCount = 1;
    [animationImage startAnimating];
}


-(void)bulletRobotFireAnimation
{
    animationImage = [[UIImageView alloc] initWithFrame:CGRectMake (bulletRobot.center.x, bulletRobot.center.y, 15, 15)];
    [self.view addSubview:animationImage];
    animationImage.animationImages = [self creatAnimation:@"fireAnimation.jpg"];
    animationImage.animationDuration = 0.9;
    animationImage.animationRepeatCount = 1;
    [animationImage startAnimating];
}


-(void)ballAnimation
{
    animationImage = [[UIImageView alloc] initWithFrame:CGRectMake (ball.center.x, ball.center.y, 15, 15)];
    [self.view addSubview:animationImage];
    animationImage.animationImages = [self creatAnimation:@"fireAnimation.jpg"];
    animationImage.animationDuration = 0.01;
    animationImage.animationRepeatCount = 1;
    [animationImage startAnimating];
}


- (NSArray*)creatAnimation:(NSString*)fireAnimation{
    UIImage *image = [UIImage imageNamed:fireAnimation];
    NSMutableArray *animationImages = [NSMutableArray array];
    
    for (int i = 0; i<8; i++) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage,
                                                           CGRectMake(i*100, 0, 100, 100));
        UIImage *animationImage = [UIImage imageWithCGImage:imageRef];
        [animationImages addObject:animationImage];
        CGImageRelease(imageRef);
    }
    return animationImages;
}


@end
