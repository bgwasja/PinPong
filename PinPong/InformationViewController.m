//
//  InformationViewController.m
//  PinPong
//
//  Created by wasja on 3/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "InformationViewController.h"
#import "Twitter/Twitter.h"


@interface InformationViewController ()

@end

@implementation InformationViewController
@synthesize txtView;

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
    txtView.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)twitterButtonTapped:(id)sender {
    TWTweetComposeViewController *tweet = [[TWTweetComposeViewController alloc] init];
    [tweet setInitialText:@"Look this game"];
    [tweet addURL:[NSURL URLWithString:@"http://google.com"]];
    [self presentModalViewController:tweet animated:YES];
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [txtView resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
