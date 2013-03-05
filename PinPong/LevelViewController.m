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

@interface LevelViewController ()

@end

@implementation LevelViewController
@synthesize levelTable;
@synthesize levels;

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
	
    self.levels = [NSArray arrayWithObjects:@"Level 1", @"Level 2", @"Level 3", @"Level 4", @"Level 5", @"Level 6", @"Level 7", @"Level 8", nil];
    levelTable.rowHeight = 41;
    levelTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field.png"]];

}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"levels"]) {
        ViewController* c = (ViewController*)segue.destinationViewController;
        c.view;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return levels.count;
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
    cell.textLabel.text = [levels objectAtIndex:indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            NSLog(@"cell1");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 1;
            break;
        case 1:
            NSLog(@"cell2");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 2;
            break;
        case 2:
            NSLog(@"cell3");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 3;
            break;
        case 3:
            NSLog(@"cell4");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 4;
            break;
        case 4:
            NSLog(@"cell5");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 5;
            break;
        case 5:
            NSLog(@"cell6");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 6;
            break;
        case 6:
            NSLog(@"cell7");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 7;
            break;
        case 7:
            NSLog(@"cell8");
            [self performSegueWithIdentifier:@"levels" sender:self];
            levelId = 8;
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
