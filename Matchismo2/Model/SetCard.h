//
//  SetCard.h
//  Matchismo2
//
//  Created by David Lee on 5/11/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shading;
@property (nonatomic) NSUInteger number;

+ (NSArray *)validColors;
+ (NSArray *)validSymbols;
+ (NSUInteger)maxNumber;
+ (NSArray *)validShadings;


@end
