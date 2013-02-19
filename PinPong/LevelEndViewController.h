//
//  LevelEndViewController.h
//  PinPong
//
//  Created by wasja on 2/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AppDelegate.h"

@interface LevelEndViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *yourScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *robotScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusGameLabel;

- (IBAction)nextLevelButtonTapped:(id)sender;
- (IBAction)menuButtonTapped:(id)sender;

-(void) setScore1:(int)score1;
-(void) setScore2:(int)score2;
-(void) setStatusGame:(NSString*)status;

@end
