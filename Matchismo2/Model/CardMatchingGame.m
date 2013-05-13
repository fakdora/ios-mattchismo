//
//  CardMatchingGame.m
//  Matchismo2
//
//  Created by David Lee on 5/10/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *descriptionOfLastFlip;
@end

@implementation CardMatchingGame

@synthesize cardMatchNumber = _cardMatchNumber;

- (void)setCardMatchNumber:(int)cardMatchNumber
{
    _cardMatchNumber = cardMatchNumber;
}

- (int)cardMatchNumber
{
    _cardMatchNumber = (_cardMatchNumber ? _cardMatchNumber : 2);
    return _cardMatchNumber;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck 
{
    self = [super init];
    
    if (self) 
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    
    return self;
}


- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}


- (int)matchBonus
{
    if (!_matchBonus) _matchBonus = 4;
    return _matchBonus;
}

- (int)mismatchPenalty
{
    if (!_mismatchPenalty) _mismatchPenalty = 2;
    return _mismatchPenalty;
}

- (int)flipCost
{
    if (!_flipCost) _flipCost = 1;
    return _flipCost;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnplayable) {
        if (!card.isFaceUp) {
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            NSMutableArray *otherContents = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [otherCards addObject:otherCard];
                    [otherContents addObject:otherCard.contents];
                }
            }
            if ([otherCards count] < self.cardMatchNumber - 1) {
                self.descriptionOfLastFlip = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            } else {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    card.unplayable = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.unplayable = YES;
                        
                    }
                    self.score += matchScore * self.matchBonus;
                    self.descriptionOfLastFlip =
                    [NSString stringWithFormat:@"Matched %@ & %@ for %d points",
                     card.contents,
                     [otherContents componentsJoinedByString:@" & "],
                     matchScore * self.matchBonus];
                } else {
                    for (Card *otherCard in otherCards) {
                        otherCard.faceUp = NO;
                    }
                    self.score -= self.mismatchPenalty;
                    self.descriptionOfLastFlip =
                    [NSString stringWithFormat:@"%@ & %@ don’t match! %d point penalty!",
                     card.contents,
                     [otherContents componentsJoinedByString:@" & "],
                     self.mismatchPenalty];
                }
            }
            self.score -= self.flipCost;
        }
        card.faceUp = !card.faceUp;
    }
}

@end
