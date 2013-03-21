//
//  Wall.m
//  PinPong
//
//  Created by wasja on 2/12/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Wall.h"

@implementation Wall

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"wall.png"];
        objectSpeed = CGPointMake (0, 0);
    }
    return self;
}


@end
