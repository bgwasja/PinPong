//
//  ViewController.h
//  PinPong
//
//  Created by wasja on 1/27/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define intMaxScore 10
#define intMaxLevel 8

@class Wall;
@class PlayerBoard;
@class Bullet;
@class Ball;

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
{
    int scores1;
    int scores2;
    NSTimer* gameTimer;
    int addBall;
}

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel1;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel2;
@property (retain, nonatomic) NSMutableArray* objects;
@property (retain, nonatomic) NSString *statusGameString;
@property (strong, nonatomic) Wall *topWall;
@property (strong, nonatomic) Wall *bottomWall;
@property (strong, nonatomic) Wall *leftWall;
@property (strong, nonatomic) Wall *rightWall;
@property (strong, nonatomic) PlayerBoard *board;
@property (strong, nonatomic) PlayerBoard *board2;
@property (strong, nonatomic) Bullet *bullet;
@property (strong, nonatomic) Ball *ball;
@property (retain, nonatomic) IBOutlet UIImageView *animationImage;

- (IBAction)addBallButtonTapped:(id)sender;

-(void)onPlayer1HaveScore;
-(void)onPlayer2HaveScore;
-(void)playRobot;
-(void)updateScore;
-(void)levelOver;
-(void)gameOver;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)movementFire;
-(void)fireAnimation;
-(void)addBoard;
-(NSArray*)creatAnimation:(NSString*)fireAnimation;
-(void)ballAnimation;
-(void)addBall;

@end
