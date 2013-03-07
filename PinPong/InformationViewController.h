//
//  InformationViewController.h
//  PinPong
//
//  Created by wasja on 3/7/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *txtView;

- (IBAction)twitterButtonTapped:(id)sender;

@end
