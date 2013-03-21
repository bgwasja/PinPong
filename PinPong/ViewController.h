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
@class Ball;
@class Block;
@class BlockDetonating;
@class PlayerBoard;
@class BulletPlayer;
@class BulletRobot;
@class BlockDeleteScores;
@class SoundGame;
@class BulletRobotSpecial;

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
{
    int scoresPlayer;
    int scoresRobot;
    int addBall;
    int numberBulletPlayer;
    NSTimer* gameTimer;
    NSTimer* bulletRobotTimer;
    NSTimer* bulletRobotSpecialTimer;
    UIColor* fieldImage;
}

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel1;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel2;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberBulletPlayerLabel;
@property (retain, nonatomic) IBOutlet UIImageView *animationImage;
@property (retain, nonatomic) NSMutableArray* objects;
@property (retain, nonatomic) NSMutableArray* objectsToDelete;
@property (retain, nonatomic) NSString *statusGameString;
@property (strong, nonatomic) Wall *topWall;
@property (strong, nonatomic) Wall *bottomWall;
@property (strong, nonatomic) Wall *leftWall;
@property (strong, nonatomic) Wall *rightWall;
@property (strong, nonatomic) PlayerBoard *boardPlayer;
@property (strong, nonatomic) PlayerBoard *boardRobot;
@property (strong, nonatomic) BulletPlayer *bulletPlayer;
@property (strong, nonatomic) BulletRobot *bulletRobot;
@property (strong, nonatomic) Ball *ball;
@property (strong, nonatomic) Block *block;
@property (strong, nonatomic) Block *wallBlock;
@property (strong, nonatomic) BlockDetonating *blockDetonating;
@property (strong, nonatomic) BlockDeleteScores *blockDeleteScores;
@property (strong, nonatomic) BulletRobotSpecial *bulletRobotSpecial;


- (IBAction)addBallButtonTapped:(id)sender;

-(void)onPlayerHaveScore;
-(void)onRobotHaveScore;
-(void)playRobot;
-(void)updateScore;
-(void)levelOver;
-(void)gameOver;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)movementFire;
-(void)bulletPlayerFireAnimation;
-(void)bulletRobotFireAnimation;
-(void)addBoard;
-(NSArray*)createAnimation:(NSString*)fireAnimation;
-(void)addBall;
-(void)addBulletPlayer;
-(void)addBulletRobot;
-(void)addBlock;
-(void)levelGame;
-(void)addBlockDetonating;
-(void)blockDetonationFireAnimation;
-(void)addWallBlock;
-(void)deletePlayerScore;
-(void)deleteRobotScore;
-(void)addBlockDeleteScores;
-(void)blockDeleteScoresAnimation;
-(void)killTimers;
-(void)updateNumberBullet;
-(void)playerFired;
-(void)addBulletRobotSpecial;
-(void)gameOverSpeed;

@end
