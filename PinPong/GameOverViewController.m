//
//  GameOverViewController.m
//  PinPong
//
//  Created by wasja on 2/19/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "GameOverViewController.h"
#import "ViewController.h"
#import "SoundGame.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController

@synthesize animationFireworkImage;
@synthesize yourScoreLabel;
@synthesize robotScoreLabel;
@synthesize allScoresLabel;

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
//	[self fireworkAnimation];
    [[SoundGame sharedSoundGame] playSound:@"firework"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)menuButtonTapped:(id)sender {
    levelId = 1;
    allScores = 0;
    NSLog(@"Level game over %d",levelId);
}


- (IBAction)repeatButtonTapped:(id)sender {
    allScores = 0;
}


-(void)fireworkAnimation
{
    animationFireworkImage = [[UIImageView alloc] initWithFrame:CGRectMake (self.view.bounds.origin.x, self.view.bounds.origin.y, 320, 480)];
    [self.view addSubview:animationFireworkImage];
    animationFireworkImage.animationImages = [self createAnimation:@"fireworkAnimation.png"];
    animationFireworkImage.animationDuration = 1;
    animationFireworkImage.animationRepeatCount = 0;
    [animationFireworkImage startAnimating];
}


-(NSArray*)createAnimation:(NSString*)fireworkAnimation{
    UIImage *image = [UIImage imageNamed:fireworkAnimation];
    NSMutableArray *animationImages = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage,
                                                           CGRectMake(i*320, 0, 320, 480));
        UIImage *animationImage = [UIImage imageWithCGImage:imageRef];
        [animationImages addObject:animationImage];
        CGImageRelease(imageRef);
    }
    return animationImages;
}


-(void)setScore1:(int)score1{
    [yourScoreLabel setText:[NSString stringWithFormat:@"%d",score1]];
}


-(void)setScore2:(int)score2{
    [robotScoreLabel setText:[NSString stringWithFormat:@"%d",score2]];
}

-(void)setAllScores:(int)allScores{
    [allScoresLabel setText:[NSString stringWithFormat:@"%d", allScores]];
}


@end
