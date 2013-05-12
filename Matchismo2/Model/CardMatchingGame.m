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

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        
        if (!card.isFaceUp) {
            self.descriptionOfLastFlip = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        int pointsAdded = matchScore * MATCH_BONUS;
                        self.score += pointsAdded;
                        self.descriptionOfLastFlip = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, pointsAdded];
                    } else {
                        otherCard.faceUp = NO;
                        int pointsDeducted = MISMATCH_PENALTY;
                        self.score -= pointsDeducted;
                        
                        self.descriptionOfLastFlip = [NSString stringWithFormat:@"%@ & %@ Don't match. %d points penalty!", card.contents, otherCard.contents, pointsDeducted];
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
