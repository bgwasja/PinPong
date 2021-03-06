//
//  GameOverViewController.h
//  PinPong
//
//  Created by wasja on 2/19/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOverViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *animationFireworkImage;
@property (weak, nonatomic) IBOutlet UILabel *yourScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *robotScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *allScoresLabel;

-(IBAction)menuButtonTapped:(id)sender;
-(IBAction)repeatButtonTapped:(id)sender;

-(void)setScore1:(int)score1;
-(void)setScore2:(int)score2;
-(void)setAllScores:(int)allScores;

@end
