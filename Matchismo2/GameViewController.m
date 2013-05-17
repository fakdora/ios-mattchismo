//
//  GameViewController.m
//  Matchismo2
//
//  Created by David Lee on 5/12/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "GameViewController.h"


@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;

@end

@implementation GameViewController


@synthesize startingCardCount = _startingCardCount;

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck
{
    return nil;
}

- (GameResults *)gameResult
{
    if (!_gameResult)
        _gameResult = [[GameResults alloc] init];
    return _gameResult;
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
    int index = 0; // ???
    [self.game flipCardAtIndex:index];
    self.flipCount++;
    [self updateUI];
    //self.gameResult.score = self.game.score;
}

@end
