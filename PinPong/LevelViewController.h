//
//  LevelViewController.h
//  PinPong
//
//  Created by wasja on 3/1/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "ViewController.h"

@interface LevelViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *levelTable;
    NSArray *levelsArray;
    Ball *ball;
}

@property (retain, nonatomic) IBOutlet UITableView *levelTable;
@property (retain, nonatomic) NSArray *levelsArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorBallSegmented;

-(IBAction)didSelectSegment:(id)sender;
@end
