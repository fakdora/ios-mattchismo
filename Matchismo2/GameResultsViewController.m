//
//  GameResultsViewController.m
//  Matchismo2
//
//  Created by David Lee on 5/11/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameResults.h"
@interface GameResultsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *display;
@end

@implementation GameResultsViewController

- (void)updateUI
{
    NSString *displayText = @"";
    for (GameResults *result in [GameResults allGameResults])
    {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0g)",
                       result.score, result.end, round(result.duration)];
        
    }
    self.display.text = displayText;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)setup
{
    //initialization that can't wait until viewDidLoad
}
- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

@end
