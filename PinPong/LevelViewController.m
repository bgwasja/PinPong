//
//  LevelViewController.m
//  PinPong
//
//  Created by wasja on 3/1/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "LevelViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h> 
#import "Ball.h"
#import "LevelCell.h"



@interface LevelViewController ()

@end

@implementation LevelViewController
@synthesize levelsArray;


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
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"LevelCell"];
    self.levelsArray = [NSArray arrayWithObjects:
                        @"Level  -  1", @"Level  -  2",
                        @"Level  -  3", @"Level  -  4",
                        @"Level  -  5", @"Level  -  6",
                        @"Level  -  7", @"Level  -  8", nil];
}


#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [levelsArray count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LevelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
    cell.backgroundView = bg;
    cell.numberLevel.text = [levelsArray objectAtIndex:indexPath.row];
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionView *header = nil;
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"MyHeader"
                                                           forIndexPath:indexPath];
        header.headerLabel.text = @"Select level";
    }
    return header;
}


#pragma mark -
#pragma mark UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            levelId = 1;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 1:
            levelId = 2;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 2:
            levelId = 3;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 3:
            levelId = 4;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 4:
            levelId = 5;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 5:
            levelId = 6;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 6:
            levelId = 7;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        case 7:
            levelId = 8;
            [self performSegueWithIdentifier:@"levels" sender:self];
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
