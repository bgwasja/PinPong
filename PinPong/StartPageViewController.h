//
//  StartPageViewController.h
//  PinPong
//
//  Created by wasja on 2/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface StartPageViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)playButtonTapped:(id)sender;
- (IBAction)emailButtonTapped:(id)sender;

@end
