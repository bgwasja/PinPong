//
//  StartPageViewController.m
//  PinPong
//
//  Created by wasja on 2/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "StartPageViewController.h"
#import "AppDelegate.h"


@interface StartPageViewController ()

@end

@implementation StartPageViewController

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
    
    levelId = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonTapped:(id)sender {
    //levelId = 1;
}

- (IBAction)emailButtonTapped:(id)sender {
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    NSArray *emailAddresses = [[NSArray alloc] initWithObjects:@"me@company.com", nil];
    NSString *sendSubject = [[NSString alloc] initWithFormat:@"PinPong Game"];
    NSString *sendMessage = [[NSString alloc] initWithFormat:@"test game"];
    
    [mailComposer setToRecipients:emailAddresses];
    [mailComposer setSubject:sendSubject];
    [mailComposer setMessageBody:sendMessage isHTML:NO];
    [self presentViewController:mailComposer animated:YES completion:NULL];
}


-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
