//
//  GameOverViewController.m
//  PinPong
//
//  Created by wasja on 2/19/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "GameOverViewController.h"
#import "ViewController.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController

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


- (IBAction)menuButtonTapped:(id)sender {
    levelId = 1;
    speedBulletAnimation = 1.5;
    NSLog(@"Level = %d , speedBulletAnimation = %f",levelId, speedBulletAnimation);
}
@end
