//
//  SetDeck.m
//  Matchismo2
//
//  Created by David Lee on 5/11/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck
- (id)init
{
    self = [super init];
    if (self) {
        for (NSString *color in [SetCard validColors]) {
            for (NSString *symbol in [SetCard validSymbols]) {
                for (NSString *shading in [SetCard validShadings]) {
                    for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.symbol = symbol;
                        card.shading = shading;
                        card.number = number;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}
@end
