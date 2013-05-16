//
//  LevelViewController.h
//  PinPong
//
//  Created by wasja on 3/1/13.
//  Copyright (c) 2013 wasja. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionView.h"


@interface LevelViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (retain, nonatomic) NSArray *levelsArray;

@end
