//
//  LevelEndViewController.m
//  PinPong
//
//  Created by wasja on 2/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "LevelEndViewController.h"
#import "ViewController.h"

@interface LevelEndViewController ()

@end

@implementation LevelEndViewController
@synthesize yourScoreLabel;
@synthesize robotScoreLabel;
@synthesize statusGameLabel;

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
 //   levelId++;
}

- (IBAction)menuButtonTapped:(id)sender {
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


@end