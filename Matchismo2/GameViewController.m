//
//  GameViewController.m
//  Matchismo2
//
//  Created by David Lee on 5/12/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "GameViewController.h"


@interface GameViewController ()

@end

@implementation GameViewController



- (GameResults *)gameResult
{
    if (!_gameResult)
        _gameResult = [[GameResults alloc] init];
    return _gameResult;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{
    
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    //self.gameResult.score = self.game.score;
}

@end
