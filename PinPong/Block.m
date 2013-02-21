//
//  Block.m
//  PinPong
//
//  Created by wasja on 2/21/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "Block.h"

@implementation Block

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"block.jpg"];
        objectSpeed = CGPointMake (0, 0);
    }
    return self;
}

@end
