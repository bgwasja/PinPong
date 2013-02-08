//
//  ViewController.h
//  PinPong
//
//  Created by wasja on 1/27/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Ball.h"

@class Ball;

@interface ViewController : UIViewController
{
    int scores1;
    int scores2;
    NSTimer* gameTimer;
    int addBall;
}

@property (strong, nonatomic) IBOutlet UIImageView *board;
@property (strong, nonatomic) IBOutlet UIImageView *board2;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel1;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel2;
@property (retain, nonatomic) NSMutableArray* balls;
@property (retain, nonatomic) NSString *statusGameString;

- (IBAction)addBallButtonTapped:(id)sender;

-(void)playRobot;
-(void)updateScore;
-(void)levelOver;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end
