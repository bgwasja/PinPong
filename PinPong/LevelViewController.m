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

@interface LevelViewController ()

@end

@implementation LevelViewController
@synthesize levelTable;
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
	
    self.levelsArray = [NSArray arrayWithObjects:
                        @"Level  -  1", @"Level  -  2",
                        @"Level  -  3", @"Level  -  4",
                        @"Level  -  5", @"Level  -  6",
                        @"Level  -  7", @"Level  -  8", nil];
    levelTable.rowHeight = 41;
    levelTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field.png"]];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return levelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
    }
    tableView.layer.cornerRadius = 10;
    cell.textLabel.text = [levelsArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.font = [UIFont fontWithName:@"Palatino Bold" size:17];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
