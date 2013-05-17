//
//  CardGameViewController.m
//  Matchismo2
//
//  Created by David Lee on 5/9/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h" 
#import "PlayingCard.h"
#import "CardMatchingGame.h"
#import "GameResults.h"
#import "GameViewController.h"
#import "PlayingCardView.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController

- (Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    [UIView transitionWithView:self.playingCardView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        if (!self.playingCardView.faceUp) {
            [self drawRandomPlayingCard];
        }
        self.playingCardView.faceUp = !self.playingCardView.faceUp;
    }
    completion:NULL];
    
    
}

- (void)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
        
    }
}

- (void)setPlayingCardView:(PlayingCardView *)playingCardView
{
    _playingCardView = playingCardView;
    [self drawRandomPlayingCard];
    [playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:playingCardView action:@selector(pinch:) ]];
}

@synthesize game = _game;

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:12 usingDeck:[[PlayingCardDeck alloc] init]];
    
    return _game;
}

- (void)updateUI
{
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