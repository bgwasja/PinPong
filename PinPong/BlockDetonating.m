//
//  BlockDetonating.m
//  PinPong
//
//  Created by wasja on 2/26/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "BlockDetonating.h"

@implementation BlockDetonating

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"blockDetonating.jpeg"];
        objectSpeed = CGPointMake (0, 0);
    }
    return self;
}

@end
