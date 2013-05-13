//
//  CardMatchingGame.h
//  Matchismo2
//
//  Created by David Lee on 5/10/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSString *descriptionOfLastFlip;
@property (nonatomic, readonly) int score;

@property (nonatomic) int cardMatchNumber;
@property (nonatomic) int matchBonus;
@property (nonatomic) int mismatchPenalty;
@property (nonatomic) int flipCost;

@end
