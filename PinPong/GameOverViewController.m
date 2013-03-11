//
//  GameOverViewController.m
//  PinPong
//
//  Created by wasja on 2/19/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "GameOverViewController.h"
#import "ViewController.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController
@synthesize animationFireworkImage;

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
	[self fireworkAnimation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)menuButtonTapped:(id)sender {
    levelId = 1;
    NSLog(@"Level game over %d",levelId);
}


-(void)fireworkAnimation
{
    animationFireworkImage = [[UIImageView alloc] initWithFrame:CGRectMake (self.view.bounds.origin.x, self.view.bounds.origin.y, 240, 320)];
    [self.view addSubview:animationFireworkImage];
    animationFireworkImage.animationImages = [self createAnimation:@"playerFireAnimation.png"];
    animationFireworkImage.animationDuration = 1;
    animationFireworkImage.animationRepeatCount = 0;
    [animationFireworkImage startAnimating];
}


-(NSArray*)createAnimation:(NSString*)fireworkAnimation{
    UIImage *image = [UIImage imageNamed:fireworkAnimation];
    NSMutableArray *animationImages = [NSMutableArray array];
    
    for (int i = 0; i < 6; i++) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage,
                                                           CGRectMake(i*240, 0, 240, 320));
        UIImage *animationImage = [UIImage imageWithCGImage:imageRef];
        [animationImages addObject:animationImage];
        CGImageRelease(imageRef);
    }
    return animationImages;
}


@end
