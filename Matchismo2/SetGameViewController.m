//
//  SetGameViewController.m
//  Matchismo2
//
//  Created by David Lee on 5/11/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "CardMatchingGame.h"
#import "SetCard.h"
#import "Card.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

@synthesize game = _game;
- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[SetDeck alloc] init]];
        self.game.cardMatchNumber = 3;
    }
    
    return _game;
}



- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        //[cardButton setTitle:card.contents forState:UIControlStateSelected];
        //[cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:card.contents];
        if ([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            title = [self updateAttributedString:title withAttributesOfCard:setCard];
        }
        [cardButton setAttributedTitle:title forState:UIControlStateNormal];
        
        //cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.statusLabel.text = self.game.descriptionOfLastFlip;
}


- (NSAttributedString *)updateAttributedString:(NSAttributedString *)attributedString withAttributesOfCard:(SetCard *)card
{
    NSMutableAttributedString *mutableAttributedString = [attributedString mutableCopy];
    NSRange range = [[mutableAttributedString string] rangeOfString:card.symbol];
    if (range.location != NSNotFound) {
        NSString *symbol = @"?";
        if ([card.symbol isEqualToString:@"oval"]) symbol = @"●";
        if ([card.symbol isEqualToString:@"squiggle"]) symbol = @"▲";
        if ([card.symbol isEqualToString:@"diamond"]) symbol = @"■";
        NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
        if ([card.color isEqualToString:@"red"])
            [attributes setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
        if ([card.color isEqualToString:@"green"])
            [attributes setObject:[UIColor greenColor] forKey:NSForegroundColorAttributeName];
        if ([card.color isEqualToString:@"purple"])
            [attributes setObject:[UIColor purpleColor] forKey:NSForegroundColorAttributeName];
        if ([card.shading isEqualToString:@"solid"])
            [attributes setObject:@-5 forKey:NSStrokeWidthAttributeName];
        if ([card.shading isEqualToString:@"striped"])
            [attributes addEntriesFromDictionary:@{
                     NSStrokeWidthAttributeName : @-5,
                     NSStrokeColorAttributeName : attributes[NSForegroundColorAttributeName],
                 NSForegroundColorAttributeName : [attributes[NSForegroundColorAttributeName] colorWithAlphaComponent:0.1]
             }];
        if ([card.shading isEqualToString:@"open"])
            [attributes setObject:@5 forKey:NSStrokeWidthAttributeName];
        symbol = [symbol stringByPaddingToLength:card.number withString:symbol startingAtIndex:0];
        [mutableAttributedString replaceCharactersInRange:range
                                     withAttributedString:[[NSAttributedString alloc] initWithString:symbol
                                                                                          attributes:attributes]];
    }
    
    return mutableAttributedString;
}

@end
