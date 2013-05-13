//
//  GameResults.h
//  Matchismo2
//
//  Created by David Lee on 5/11/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResults : NSObject

+ (NSArray *)allGameResults;

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@end
