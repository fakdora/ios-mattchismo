//
//  PlayingCardView.h
//  Matchismo2
//
//  Created by David Lee on 5/16/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView


@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString* suit;

@property (nonatomic) BOOL faceUp;
- (void)pinch:(UIPinchGestureRecognizer *)gesture;
@end
