//
//  Ball.m
//  PinPong
//
//  Created by wasja on 1/31/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Ball.h"

@implementation Ball


@synthesize ball;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        ball = [[UIImageView alloc] initWithFrame:(CGRectMake(0,0, 26, 26))];
        ball.image = [UIImage imageNamed:@"ball.png"];
        
//        NSArray * arr = [NSArray arrayWithObjects:ball, ball, nil];
        
    }
    return self;
}






@end
