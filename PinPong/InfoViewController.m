//
//  InfoViewController.m
//  PinPong
//
//  Created by wasja on 2/20/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "InfoViewController.h"
#import "Twitter/Twitter.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

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


- (IBAction)twitterButtonTapped:(id)sender {
    TWTweetComposeViewController *tweet = [[TWTweetComposeViewController alloc] init];
    [tweet setInitialText:@"Test this game"];
    [tweet addURL:[NSURL URLWithString:@"http://google.com"]];
    [tweet addImage:[UIImage imageNamed:@"logo.png"]];
    [self presentModalViewController:tweet animated:YES];
}

@end
