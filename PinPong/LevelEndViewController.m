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
    if (score1 == 0) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star0.png"]];
    }
    if (score2 == 0) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star3.png"]];
    }
    if ((score2 > score1) && (score1 != 0 && score2 != 0)) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star1.png"]];
    }
    if ((score1 > score2) && (score1 != 0 && score2 != 0)) {
        starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star2.png"]];
    }
    [self.view addSubview:starImageView];
}

@end
