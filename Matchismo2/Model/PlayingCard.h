//
//  PlayingCard.h
//  Matchismo2
//
//  Created by David Lee on 5/10/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
