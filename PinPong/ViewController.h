//
//  ViewController.h
//  PinPong
//
//  Created by wasja on 1/27/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    CGPoint ballSpeed;
    int scores1;
    int scores2;
}

@property (strong, nonatomic) IBOutlet UIImageView *ball;
@property (strong, nonatomic) IBOutlet UIImageView *board;
@property (strong, nonatomic) IBOutlet UIImageView *board2;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel1;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel2;

@end
