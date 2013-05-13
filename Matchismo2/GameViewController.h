//
//  GameViewController.h
//  Matchismo2
//
//  Created by David Lee on 5/12/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"
#import "GameResults.h"

@interface GameViewController : UIViewController
// order of the buttons in the Array are undetermined.
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (strong, nonatomic) GameResults *gameResult;

@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
