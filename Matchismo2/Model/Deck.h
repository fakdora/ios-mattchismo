//
//  Deck.h
//  Matchismo2
//
//  Created by David Lee on 5/10/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL) atTop;

- (Card *) drawRandomCard;
@end
