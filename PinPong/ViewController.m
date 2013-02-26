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
#import "BulletPlayer.h"
#import "BulletRobot.h"
#import "Wall.h"
#import "PlayerBoard.h"
#import "Block.h"
#import "BlockDetonating.h"

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
@synthesize boardPlayer;
@synthesize boardRobot;
@synthesize bulletPlayer;
@synthesize bulletRobot;
@synthesize ball;
@synthesize animationImage;
@synthesize block;
@synthesize blockDetonating;

-(void)viewDidLoad
{
    [super viewDidLoad];
    scoresPlayer = 0;
    scoresRobot = 0;
    speedBulletAnimation = 2.0;
    
    objects = [[NSMutableArray alloc] init];

    NSLog(@"%d",levelId);
    
    for (int i = 0; i < levelId; i++) {
        [self addBall];
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
                                                      selector:@selector(addBulletRobot)
                                                      userInfo:nil
                                                       repeats:YES];
}

-(void)levelGame
{
    if (levelId == 2) {[self addBlock];}
    if (levelId == 3) {[self addBlockDetonating];}
}


-(void)addBoard
{
    boardPlayer = [[PlayerBoard alloc]initWithFrame:CGRectMake(160, 420, 85, 15)];
    boardPlayer.backgroundColor = [UIColor redColor];
    boardPlayer.cntrl = self;
    [self.view addSubview:boardPlayer];
    [self.objects addObject:boardPlayer];
    
    boardRobot = [[PlayerBoard alloc]initWithFrame:CGRectMake(160, 30, 85, 15)];
    boardRobot.backgroundColor = [UIColor blackColor];
    boardRobot.cntrl = self;
    boardRobot.objectSpeed = CGPointMake(6, 0);
    [self.view addSubview:boardRobot];
    [self.objects addObject:boardRobot];
}


-(void)addWall
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


-(void)addBall
{
    ball = [[Ball alloc] initWithFrame:CGRectMake(100, 100, 26, 26)];
    ball.cntrl = self;
    ball.objectSpeed = CGPointMake(1, 1);
    [self.view addSubview:ball];
    [objects addObject:ball];
}


-(void)addBulletPlayer
{
    bulletPlayer = [[BulletPlayer alloc] initWithFrame:CGRectMake(boardPlayer.center.x, boardPlayer.center.y-100, 20, 40)];
    bulletPlayer.cntrl = self;
    bulletPlayer.objectSpeed = CGPointMake(0, -1);
    [self.view addSubview:bulletPlayer];
    [objects addObject:bulletPlayer];
}


-(void)addBulletRobot
{
    bulletRobot = [[BulletRobot alloc] initWithFrame:CGRectMake(boardPlayer.center.x, boardRobot.center.y, 20, 40)];
    bulletRobot.cntrl = self;
    bulletRobot.objectSpeed = CGPointMake(0, 1);
    [self.view addSubview:bulletRobot];
    [objects addObject:bulletRobot];
}


-(void)addBlock
{
    block = [[Block alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    block.cntrl = self;
    block.objectSpeed = CGPointMake(0, 0);
    [self.view addSubview:block];
    [self.objects addObject:block];
}

-(void)addBlockDetonating
{
    blockDetonating = [[BlockDetonating alloc] initWithFrame:CGRectMake(180, 140, 40, 40)];
    blockDetonating.cntrl = self;
    blockDetonating.objectSpeed = CGPointMake(0, 0);
    [self.view addSubview:blockDetonating];
    [self.objects addObject:blockDetonating];
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
        if (ball.center.x < boardRobot.center.x) {
            CGPoint p = CGPointMake(boardRobot.center.x-speed, boardRobot.center.y);
            boardRobot.center = p;
        }
        if (ball.center.x > boardRobot.center.x) {
            CGPoint p = CGPointMake(boardRobot.center.x+speed, boardRobot.center.y);
            boardRobot.center = p;
        }
    }
}


-(Ball*) nearestBall
{
    Ball* nearestBall = nil;
    float minDistance = MAXFLOAT;
    
    for (ball in self.objects) {
        float distance = ball.center.y - boardRobot.center.y;
        if (distance < minDistance) {
            minDistance = distance;
            nearestBall = ball;
        }
    }
    return nearestBall;
}


-(void)onPlayerHaveScore {
    scoresPlayer++;
}


-(void)onRobotHaveScore {
    scoresRobot++;
}


-(void)updateScore
{
    scoreLabel1.text = [NSString stringWithFormat:@"%d",scoresPlayer];
    scoreLabel2.text = [NSString stringWithFormat:@"%d",scoresRobot];
}


-(void)levelOver
{
    if (scoresPlayer >= intMaxScore || scoresRobot >= intMaxScore) {
        if (scoresPlayer >= intMaxScore) {
            statusGameString = [NSString stringWithFormat:@"You win !!!"];
        }
        if (scoresRobot >= intMaxScore) {
            statusGameString = [NSString stringWithFormat:@"You loser !!!"];
        }
        [self performSegueWithIdentifier:@"level" sender:self];
    }
}


-(void)gameOver
{
    if (levelId == intMaxLevel) {
        if (scoresPlayer == intMaxScore || scoresRobot == intMaxScore) {
            [self performSegueWithIdentifier:@"gameOver" sender:self];
        }
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    CGPoint xLocation = CGPointMake(touchLocation.x, boardPlayer.center.y);
    boardPlayer.center = xLocation;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"level"]) {
        LevelEndViewController* c = (LevelEndViewController*)segue.destinationViewController;
        c.view;
        [c setScore1:[scoreLabel1.text intValue]];
        [c setScore2:[scoreLabel2.text intValue]];
        [c setStatusGame:statusGameString];
        [c setStar:scoresPlayer :scoresRobot];
    }
}


-(void)movementFire
{
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(addBulletPlayer)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
}


-(void)bulletPlayerFireAnimation
{
    animationImage = [[UIImageView alloc] initWithFrame:CGRectMake (bulletPlayer.center.x, bulletPlayer.center.y, 15, 15)];
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


-(NSArray*)creatAnimation:(NSString*)fireAnimation{
    UIImage *image = [UIImage imageNamed:fireAnimation];
    NSMutableArray *animationImages = [NSMutableArray array];
    
    for (int i = 0; i < 8; i++) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage,
                                                           CGRectMake(i*100, 0, 100, 100));
        UIImage *animationImage = [UIImage imageWithCGImage:imageRef];
        [animationImages addObject:animationImage];
        CGImageRelease(imageRef);
    }
    return animationImages;
}


@end
