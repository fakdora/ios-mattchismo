//
//  CardGameViewController.m
//  Matchismo2
//
//  Created by David Lee on 5/9/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h" 
#import "CardMatchingGame.h"
#import "GameResults.h"
#import "GameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

@synthesize game = _game;


- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc] init]];
    
    return _game;
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.statusLabel.text = self.game.descriptionOfLastFlip;
}
- (IBAction)dealButton:(UIButton *)sender {
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}


@end