//
//  PlayerBoard.m
//  PinPong
//
//  Created by wasja on 2/14/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "PlayerBoard.h"

@implementation PlayerBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"board1.png"];
    }
    return self;
}



@end
