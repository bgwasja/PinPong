//
//  LevelEndViewController.m
//  PinPong
//
//  Created by wasja on 2/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "LevelEndViewController.h"
#import "ViewController.h"
#import "MovableObject.h"

@interface LevelEndViewController ()

@end

@implementation LevelEndViewController
@synthesize yourScoreLabel;
@synthesize robotScoreLabel;
@synthesize statusGameLabel;
@synthesize starImagesArray;
@synthesize starImageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    starImagesArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"star0.png"] ,[UIImage imageNamed:@"star1.png"] ,  [UIImage imageNamed:@"star2.png"],[UIImage imageNamed:@"star3.png"],nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nextLevelButtonTapped:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.view
                             cache:NO];
    [UIView commitAnimations];
    levelId++;
    speedBulletAnimation = speedBulletAnimation - 0.5;
    NSLog(@"Level = %d , speedBulletAnimation = %f",levelId, speedBulletAnimation);
}


- (IBAction)menuButtonTapped:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:self.view
                             cache:NO];
    [UIView commitAnimations];
    levelId = 1;
    speedBulletAnimation = 1.5 ;
    NSLog(@"Level = %d , speedBulletAnimation = %f",levelId, speedBulletAnimation);
}


-(void) setScore1:(int)score1{
    [yourScoreLabel setText:[NSString stringWithFormat:@"%d",score1]];
}


-(void) setScore2:(int)score2{
    [robotScoreLabel setText:[NSString stringWithFormat:@"%d",score2]];
}


-(void) setStatusGame:(NSString*)status{
    [statusGameLabel setText:[NSString stringWithString:status]];
}


-(void)setStar:(int)score1 :(int)score2{
    
    percentage = score1/score2;
    
    if (score1 == 0) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: [starImagesArray objectAtIndex:0]]];
    }
    if (percentage > 0.1  && percentage <= 0.3) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: [starImagesArray objectAtIndex:1]]];
    }
    if (percentage > 0.3 && percentage <= 0.6) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: [starImagesArray objectAtIndex:2]]];
    }
    if (percentage > 0.6) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: [starImagesArray objectAtIndex:3]]];
    }
}


@end
